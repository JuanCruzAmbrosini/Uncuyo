#!/bin/bash
# ============================================================
# DynamoDB — Día 2: Pipeline Kinesis → DynamoDB
# NOTA: Lambda no funciona en LocalStack Community.
#       Se simula el resultado insertando directo en DynamoDB.
# Ejecutar desde la carpeta del proyecto: bash dia2.sh
# ============================================================

set -e

echo "===================================="
echo " DynamoDB Día 2 — Pipeline Kinesis"
echo "===================================="

export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
ENDPOINT="--endpoint-url http://localhost:4566"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 1 — Crear archivos necesarios"
# ------------------------------------------------------------

cat > sensor-data-table.json << 'EOF'
{
  "TableName": "SensorData",
  "AttributeDefinitions": [
    {"AttributeName": "sensor_id", "AttributeType": "S"},
    {"AttributeName": "current_time", "AttributeType": "N"}
  ],
  "KeySchema": [
    {"AttributeName": "sensor_id", "KeyType": "HASH"},
    {"AttributeName": "current_time", "KeyType": "RANGE"}
  ],
  "ProvisionedThroughput": {
    "ReadCapacityUnits": 1,
    "WriteCapacityUnits": 1
  }
}
EOF

cat > lambda-kinesis-role.json << 'EOF'
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {"Service": "lambda.amazonaws.com"},
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

echo "OK — Archivos creados"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 2 — Crear tabla SensorData"
# ------------------------------------------------------------

aws dynamodb create-table --cli-input-json file://sensor-data-table.json \
  $ENDPOINT

echo "--- Estado de la tabla:"
aws dynamodb describe-table --table-name SensorData $ENDPOINT \
  --query "Table.TableStatus"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 3 — Crear stream Kinesis"
# ------------------------------------------------------------

export STREAM_NAME="temperature-sensor-data"

aws kinesis create-stream --stream-name $STREAM_NAME --shard-count 1 \
  $ENDPOINT

echo "--- Estado del stream:"
aws kinesis describe-stream --stream-name $STREAM_NAME \
  $ENDPOINT --query "StreamDescription.StreamStatus"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 4 — Guardar ARN del stream"
# ------------------------------------------------------------

export KINESIS_STREAM_ARN=$(aws kinesis describe-stream \
  --stream-name $STREAM_NAME \
  $ENDPOINT \
  --query "StreamDescription.StreamARN" --output text)

echo "Stream ARN: $KINESIS_STREAM_ARN"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 5 — Enviar dato al stream Kinesis"
# ------------------------------------------------------------

export DATA=$(echo -n '{"sensor_id":"sensor-1","temperature":99.9,"current_time":123456789}' | base64 -w 0)

aws kinesis put-record \
  --stream-name $STREAM_NAME \
  --partition-key sensor-data \
  --data $DATA \
  $ENDPOINT

echo "OK — Dato enviado a Kinesis"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 6 — Simular Lambda: insertar dato directo en SensorData"
echo "    (Lambda no disponible en LocalStack Community)"
# ------------------------------------------------------------

aws dynamodb put-item --table-name SensorData \
  --item '{"sensor_id":{"S":"sensor-1"},"current_time":{"N":"123456789"},"temperature":{"N":"99.9"}}' \
  $ENDPOINT

echo "--- Verificar dato en SensorData:"
aws dynamodb scan --table-name SensorData $ENDPOINT

echo ""
echo "===================================="
echo " Día 2 completado"
echo " Pipeline: Kinesis recibe → Lambda procesa (simulado) → DynamoDB persiste"
echo "===================================="
