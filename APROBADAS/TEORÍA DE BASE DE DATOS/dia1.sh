#!/bin/bash
# ============================================================
# DynamoDB — Día 1: CRUD, Books, LSI y GSI
# Ejecutar desde la carpeta del proyecto: bash dia1.sh
# ============================================================

set -e  # Detener si hay error

echo "===================================="
echo " DynamoDB Día 1 — Setup"
echo "===================================="

export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
ENDPOINT="--endpoint-url http://localhost:4566"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 1 — Crear archivos JSON"
# ------------------------------------------------------------

# Items ShoppingCart
echo '{"ItemName":{"S":"Tickle Me Elmo"}}' > item-elmo.json
echo '{"ItemName":{"S":"1975 Buick LeSabre"}}' > item-buick.json
echo '{"ItemName":{"S":"Ken Burns: the Complete Box Set"}}' > item-burns.json
echo '{"ItemName":{"S":"1975 Buick LeSabre"},"Precio":{"N":"500"}}' > item-buick-precio.json

# Keys ShoppingCart
echo '{"ItemName":{"S":"Tickle Me Elmo"}}' > key-elmo.json
echo '{"ItemName":{"S":"1975 Buick LeSabre"}}' > key-buick.json
echo '{"ItemName":{"S":"item-que-no-existe"}}' > key-inexistente.json

# Items Books
echo '{"Title":{"S":"Moby Dick"},"PublishYear":{"N":"1851"},"ISBN":{"S":"978-0-000-00001-1"}}' > item-moby-1851.json
echo '{"Title":{"S":"Moby Dick"},"PublishYear":{"N":"1971"},"ISBN":{"S":"978-0-000-00002-2"}}' > item-moby-1971.json
echo '{"Title":{"S":"Moby Dick"},"PublishYear":{"N":"2008"},"ISBN":{"S":"978-0-000-00003-3"}}' > item-moby-2008.json

# Expresiones Books
echo '{":title":{"S":"Moby Dick"},":year":{"N":"1980"}}' > expr-books-1980.json
echo '{":title":{"S":"Moby Dick"},":year":{"N":"1900"}}' > expr-books-1900.json

# Items BonestormData
echo '{"Username":{"S":"h4x0rjimduggan"},"Date":{"S":"04012017"},"HighScore":{"N":"751"},"Avatar":{"S":"Lion"}}' > item-h4x0r-2017-04.json
echo '{"Username":{"S":"h4x0rjimduggan"},"Date":{"S":"05032017"},"HighScore":{"N":"852"},"Avatar":{"S":"Skull"}}' > item-h4x0r-2017-05.json
echo '{"Username":{"S":"beboprocksteady75"},"Date":{"S":"04262017"},"HighScore":{"N":"451"},"Avatar":{"S":"Raptor"}}' > item-pity.json

# Expresiones BonestormData
echo '{":user":{"S":"h4x0rjimduggan"},":score":{"N":"800"}}' > expr-bonestorm-score.json
echo '{":avatar":{"S":"Lion"}}' > expr-avatar.json
echo '{"#D":"Date"}' > names-date.json

# LSI
cat > lsi-bonestorm.json << 'EOF'
[{
  "IndexName": "HighScoreIndex",
  "KeySchema": [
    {"AttributeName": "Username", "KeyType": "HASH"},
    {"AttributeName": "HighScore", "KeyType": "RANGE"}
  ],
  "Projection": {"ProjectionType": "ALL"}
}]
EOF

# GSI
cat > gsi-avatar-update.json << 'EOF'
[{
  "Create": {
    "IndexName": "AvatarIndex",
    "KeySchema": [
      {"AttributeName": "Avatar", "KeyType": "HASH"}
    ],
    "Projection": {"ProjectionType": "ALL"},
    "ProvisionedThroughput": {"ReadCapacityUnits": 1, "WriteCapacityUnits": 1}
  }
}]
EOF

echo "OK — Archivos JSON creados"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 2 — Crear tabla ShoppingCart (hash key simple)"
# ------------------------------------------------------------

aws dynamodb create-table \
  --table-name ShoppingCart \
  --attribute-definitions AttributeName=ItemName,AttributeType=S \
  --key-schema AttributeName=ItemName,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
  $ENDPOINT

echo "OK — Tabla ShoppingCart creada"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 3 — Insertar items en ShoppingCart"
# ------------------------------------------------------------

aws dynamodb put-item --table-name ShoppingCart --item file://item-elmo.json $ENDPOINT
aws dynamodb put-item --table-name ShoppingCart --item file://item-buick.json $ENDPOINT
aws dynamodb put-item --table-name ShoppingCart --item file://item-burns.json $ENDPOINT

echo "OK — 3 items insertados"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 4 — SCAN y GET"
# ------------------------------------------------------------

echo "--- SCAN (todos los items):"
aws dynamodb scan --table-name ShoppingCart $ENDPOINT

echo "--- GET (Tickle Me Elmo):"
aws dynamodb get-item --table-name ShoppingCart \
  --key file://key-elmo.json $ENDPOINT

# ------------------------------------------------------------
echo ""
echo ">>> Paso 5 — DELETE y verificar que quedan 2"
# ------------------------------------------------------------

aws dynamodb delete-item --table-name ShoppingCart \
  --key file://key-elmo.json $ENDPOINT

echo "--- SCAN tras delete (deben quedar 2):"
aws dynamodb scan --table-name ShoppingCart $ENDPOINT

# ------------------------------------------------------------
echo ""
echo ">>> Paso 6 — Crear tabla Books (hash + range key)"
# ------------------------------------------------------------

aws dynamodb create-table \
  --table-name Books \
  --attribute-definitions \
    AttributeName=Title,AttributeType=S \
    AttributeName=PublishYear,AttributeType=N \
  --key-schema \
    AttributeName=Title,KeyType=HASH \
    AttributeName=PublishYear,KeyType=RANGE \
  --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
  $ENDPOINT

echo "OK — Tabla Books creada"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 7 — Insertar 3 ediciones de Moby Dick"
# ------------------------------------------------------------

aws dynamodb put-item --table-name Books --item file://item-moby-1851.json $ENDPOINT
aws dynamodb put-item --table-name Books --item file://item-moby-1971.json $ENDPOINT
aws dynamodb put-item --table-name Books --item file://item-moby-2008.json $ENDPOINT

echo "OK — 3 ediciones insertadas"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 8 — QUERY por rango"
# ------------------------------------------------------------

echo "--- Libros post-1980 (solo 2008):"
aws dynamodb query --table-name Books \
  --expression-attribute-values file://expr-books-1980.json \
  --key-condition-expression "Title = :title AND PublishYear > :year" \
  $ENDPOINT

echo "--- Solo ISBN post-1900 (1971 y 2008):"
aws dynamodb query --table-name Books \
  --expression-attribute-values file://expr-books-1900.json \
  --key-condition-expression "Title = :title AND PublishYear > :year" \
  --projection-expression "ISBN" \
  $ENDPOINT

# ------------------------------------------------------------
echo ""
echo ">>> Paso 9 — Crear tabla BonestormData con LSI"
# ------------------------------------------------------------

aws dynamodb create-table \
  --table-name BonestormData \
  --attribute-definitions \
    AttributeName=Username,AttributeType=S \
    AttributeName=Date,AttributeType=S \
    AttributeName=HighScore,AttributeType=N \
  --key-schema \
    AttributeName=Username,KeyType=HASH \
    AttributeName=Date,KeyType=RANGE \
  --local-secondary-indexes file://lsi-bonestorm.json \
  --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
  $ENDPOINT

echo "OK — Tabla BonestormData con LSI creada"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 10 — Insertar datos de juego"
# ------------------------------------------------------------

aws dynamodb put-item --table-name BonestormData --item file://item-h4x0r-2017-04.json $ENDPOINT
aws dynamodb put-item --table-name BonestormData --item file://item-h4x0r-2017-05.json $ENDPOINT
aws dynamodb put-item --table-name BonestormData --item file://item-pity.json $ENDPOINT

echo "OK — 3 partidas insertadas"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 11 — QUERY con LSI (días con más de 800 puntos)"
# ------------------------------------------------------------

aws dynamodb query --table-name BonestormData --index-name HighScoreIndex \
  --expression-attribute-values file://expr-bonestorm-score.json \
  --key-condition-expression "Username = :user AND HighScore > :score" \
  --projection-expression "#D" \
  --expression-attribute-names file://names-date.json \
  $ENDPOINT

# ------------------------------------------------------------
echo ""
echo ">>> Paso 12 — Agregar GSI sobre Avatar"
# ------------------------------------------------------------

aws dynamodb update-table --table-name BonestormData \
  --attribute-definitions AttributeName=Avatar,AttributeType=S \
  --global-secondary-index-updates file://gsi-avatar-update.json \
  $ENDPOINT

echo "OK — GSI AvatarIndex creado (puede tardar unos segundos en activarse)"
sleep 3

# ------------------------------------------------------------
echo ""
echo ">>> Paso 13 — QUERY con GSI (usuarios con Avatar=Lion)"
# ------------------------------------------------------------

aws dynamodb query --table-name BonestormData --index-name AvatarIndex \
  --expression-attribute-values file://expr-avatar.json \
  --key-condition-expression "Avatar = :avatar" \
  --projection-expression "Username, #D" \
  --expression-attribute-names file://names-date.json \
  $ENDPOINT

echo ""
echo "===================================="
echo " Día 1 completado"
echo "===================================="
