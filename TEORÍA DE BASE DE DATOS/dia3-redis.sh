#!/bin/bash
# ============================================================
# Redis — Día 3: Pub/Sub, Transacciones, Persistencia y Lua
# Ejecutar desde cualquier carpeta: bash dia3-redis.sh
#
# NOTA: Pub/Sub requiere dos terminales. Este script cubre
# todo excepto Pub/Sub, que se detalla al final con instrucciones.
# ============================================================

set -e

REDIS="sudo docker exec -it redis-standalone redis-cli"
REDIS_NI="sudo docker exec redis-standalone redis-cli"

echo "===================================="
echo " Redis Día 3 — Pub/Sub, Transacciones y Persistencia"
echo "===================================="

# ------------------------------------------------------------
echo ""
echo ">>> Pub/Sub — requiere dos terminales (ver instrucciones al final)"
echo "    Saltando al resto del día..."
# ------------------------------------------------------------

# ------------------------------------------------------------
echo ""
echo ">>> Paso 1 — Transacciones con MULTI/EXEC"
# ------------------------------------------------------------

$REDIS_NI << 'EOF'
MULTI
SET account:alice 100
SET account:bob 50
DECRBY account:alice 30
INCRBY account:bob 30
EXEC
EOF

$REDIS_NI GET account:alice
$REDIS_NI GET account:bob

# ------------------------------------------------------------
echo ""
echo ">>> Paso 2 — Cancelar transacción con DISCARD"
# ------------------------------------------------------------

$REDIS_NI << 'EOF'
MULTI
SET temp "value"
DISCARD
EOF

$REDIS_NI EXISTS temp

# ------------------------------------------------------------
echo ""
echo ">>> Paso 3 — Persistencia"
# ------------------------------------------------------------

$REDIS_NI CONFIG GET save
$REDIS_NI CONFIG GET appendonly
$REDIS_NI BGSAVE
$REDIS_NI INFO persistence

# ------------------------------------------------------------
echo ""
echo ">>> Paso 4 — Inspeccionar claves"
# ------------------------------------------------------------

$REDIS_NI KEYS "*"
$REDIS_NI KEYS "user:*"
$REDIS_NI KEYS "tags:*"

$REDIS_NI TYPE todo
$REDIS_NI TYPE leaderboard
$REDIS_NI TYPE "user:1:profile"

$REDIS_NI DBSIZE

# ------------------------------------------------------------
echo ""
echo ">>> Paso 5 — Scripting con Lua"
# ------------------------------------------------------------

$REDIS_NI EVAL "return 'Hello from Lua!'" 0
$REDIS_NI EVAL "return redis.call('SET', KEYS[1], ARGV[1])" 1 mykey myvalue
$REDIS_NI GET mykey
$REDIS_NI EVAL "local v = redis.call('GET', KEYS[1]); redis.call('SET', KEYS[1], ARGV[1]); return v" 1 hello "new value"
$REDIS_NI GET hello
$REDIS_NI EVAL "if tonumber(redis.call('GET', KEYS[1])) > 0 then return redis.call('INCR', KEYS[1]) else return 0 end" 1 count:visits

echo ""
echo "===================================="
echo " Día 3 completado"
echo "===================================="

echo ""
echo "===================================="
echo " Instrucciones Pub/Sub (manual)"
echo "===================================="
echo ""
echo " Terminal 1:"
echo "   sudo docker exec -it redis-standalone redis-cli SUBSCRIBE news"
echo ""
echo " Terminal 2:"
echo "   sudo docker exec -it redis-standalone redis-cli PUBLISH news 'Breaking: Redis is awesome!'"
echo "   sudo docker exec -it redis-standalone redis-cli PUBLISH news 'Seven Databases chapter complete'"
echo ""
echo " Terminal 1 (Ctrl+C, luego patrón glob):"
echo "   sudo docker exec -it redis-standalone redis-cli PSUBSCRIBE 'news*'"
echo ""
echo " Terminal 2:"
echo "   sudo docker exec -it redis-standalone redis-cli PUBLISH news.sports 'Gol de Argentina!'"
echo "   sudo docker exec -it redis-standalone redis-cli PUBLISH news.tech 'Redis 8.0 released'"
echo "   sudo docker exec -it redis-standalone redis-cli PUBLISH other 'Este NO llega'"
