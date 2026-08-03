#!/bin/bash
# ============================================================
# DynamoDB — Día 3: Streams y operaciones condicionales
# Ejecutar desde la carpeta del proyecto: bash dia3.sh
# ============================================================

set -e

echo "===================================="
echo " DynamoDB Día 3 — Streams y Updates"
echo "===================================="

export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
ENDPOINT="--endpoint-url http://localhost:4566"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 1 — Crear archivos necesarios"
# ------------------------------------------------------------

echo '{"ItemName":{"S":"1975 Buick LeSabre"},"Precio":{"N":"500"}}' > item-buick-precio.json
echo '{"ItemName":{"S":"1975 Buick LeSabre"}}' > key-buick.json
echo '{"ItemName":{"S":"item-que-no-existe"}}' > key-inexistente.json
echo '{":newPrice":{"N":"750"}}' > expr-price-750.json
echo '{":newPrice":{"N":"100"}}' > expr-price-100.json

echo "OK — Archivos creados"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 2 — Habilitar DynamoDB Streams en ShoppingCart"
# ------------------------------------------------------------

aws dynamodb update-table \
  --table-name ShoppingCart \
  --stream-specification StreamEnabled=true,StreamViewType=NEW_AND_OLD_IMAGES \
  $ENDPOINT

echo "--- ARN del stream:"
aws dynamodb describe-table \
  --table-name ShoppingCart $ENDPOINT \
  --query "Table.LatestStreamArn"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 3 — Insertar Buick con precio"
# ------------------------------------------------------------

aws dynamodb put-item --table-name ShoppingCart \
  --item file://item-buick-precio.json \
  $ENDPOINT

echo "OK — Buick insertado con Precio=500"

# ------------------------------------------------------------
echo ""
echo ">>> Paso 4 — Update condicional (solo si el item existe)"
# ------------------------------------------------------------

aws dynamodb update-item --table-name ShoppingCart \
  --key file://key-buick.json \
  --update-expression "SET Precio = :newPrice" \
  --condition-expression "attribute_exists(ItemName)" \
  --expression-attribute-values file://expr-price-750.json \
  $ENDPOINT

echo "--- Verificar precio actualizado (debe ser 750):"
aws dynamodb get-item --table-name ShoppingCart \
  --key file://key-buick.json $ENDPOINT

# ------------------------------------------------------------
echo ""
echo ">>> Paso 5 — Update en item inexistente (debe fallar con ConditionalCheckFailedException)"
# ------------------------------------------------------------

aws dynamodb update-item --table-name ShoppingCart \
  --key file://key-inexistente.json \
  --update-expression "SET Precio = :newPrice" \
  --condition-expression "attribute_exists(ItemName)" \
  --expression-attribute-values file://expr-price-100.json \
  $ENDPOINT && echo "ERROR: debería haber fallado" || echo "OK — ConditionalCheckFailedException (esperado)"

echo ""
echo "===================================="
echo " Día 3 completado"
echo " Streams: capturan cambios en tiempo real"
echo " Updates condicionales: escrituras atómicas seguras"
echo "===================================="
