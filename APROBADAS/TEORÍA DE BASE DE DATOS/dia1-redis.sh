#!/bin/bash
# ============================================================
# Redis — Día 1: Strings, CRUD y Expiración
# Ejecutar desde cualquier carpeta: bash dia1-redis.sh
# ============================================================

set -e

REDIS="sudo docker exec -it redis-standalone redis-cli"

echo "===================================="
echo " Redis Día 1 — Strings y Expiración"
echo "===================================="

# ------------------------------------------------------------
echo ""
echo ">>> Paso 1 — Verificar conexión"
# ------------------------------------------------------------

$REDIS PING

# ------------------------------------------------------------
echo ""
echo ">>> Paso 2 — Operaciones básicas sobre strings"
# ------------------------------------------------------------

$REDIS SET hello world
$REDIS GET hello

# Sobreescribir:
$REDIS SET hello "Hello, Redis!"
$REDIS GET hello

# Verificar existencia y eliminar:
$REDIS EXISTS hello
$REDIS DEL hello
$REDIS EXISTS hello

# ------------------------------------------------------------
echo ""
echo ">>> Paso 3 — MSET y MGET (múltiples claves)"
# ------------------------------------------------------------

$REDIS MSET first "Tom" last "Burns" born 1949
$REDIS MGET first last born

# ------------------------------------------------------------
echo ""
echo ">>> Paso 4 — Contadores atómicos"
# ------------------------------------------------------------

$REDIS SET count:visits 0
$REDIS INCR count:visits
$REDIS INCR count:visits
$REDIS INCR count:visits
$REDIS GET count:visits

# Incrementar por valor fijo:
$REDIS INCRBY count:visits 10
$REDIS GET count:visits

# Decrementar:
$REDIS DECR count:visits
$REDIS DECRBY count:visits 5

# ------------------------------------------------------------
echo ""
echo ">>> Paso 5 — Expiración de claves (TTL)"
# ------------------------------------------------------------

$REDIS SET session:user1 "token-abc123"
$REDIS EXPIRE session:user1 30
$REDIS TTL session:user1

# SET con expiración directa:
$REDIS SET session:user2 "token-xyz789" EX 60
$REDIS TTL session:user2

# Quitar expiración:
$REDIS PERSIST session:user1
$REDIS TTL session:user1

echo ""
echo "===================================="
echo " Día 1 completado"
echo " -1 = sin expiración, -2 = clave no existe"
echo "===================================="
