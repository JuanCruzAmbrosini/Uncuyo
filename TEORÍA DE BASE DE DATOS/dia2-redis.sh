#!/bin/bash
# ============================================================
# Redis — Día 2: Listas, Sets, Sorted Sets y Hashes
# Ejecutar desde cualquier carpeta: bash dia2-redis.sh
# ============================================================

set -e

REDIS="sudo docker exec -it redis-standalone redis-cli"

echo "===================================="
echo " Redis Día 2 — Estructuras Avanzadas"
echo "===================================="

# ------------------------------------------------------------
echo ""
echo ">>> Paso 1 — Lists (cola y pila)"
# ------------------------------------------------------------

# RPUSH: agregar al final:
$REDIS RPUSH todo "Buy groceries"
$REDIS RPUSH todo "Clean the house"
$REDIS RPUSH todo "Walk the dog"
$REDIS RPUSH todo "Read Seven Databases"

# Ver lista completa:
$REDIS LRANGE todo 0 -1

# Ver longitud:
$REDIS LLEN todo

# LPUSH: agregar al principio:
$REDIS LPUSH todo "Urgent task!"
$REDIS LRANGE todo 0 -1

# Pop de cada extremo:
$REDIS RPOP todo
$REDIS LPOP todo
$REDIS LRANGE todo 0 -1

# Acceder por índice:
$REDIS LINDEX todo 0
$REDIS LINDEX todo -1

# ------------------------------------------------------------
echo ""
echo ">>> Paso 2 — Sets (conjuntos sin duplicados)"
# ------------------------------------------------------------

$REDIS SADD tags:article:1 databases nosql redis
$REDIS SADD tags:article:2 databases sql postgres
$REDIS SADD tags:article:3 nosql mongodb redis

# Ver miembros:
$REDIS SMEMBERS tags:article:1

# Cardinalidad:
$REDIS SCARD tags:article:1

# Verificar si un elemento está en el set:
$REDIS SISMEMBER tags:article:1 redis
$REDIS SISMEMBER tags:article:1 sql

# Intersección:
$REDIS SINTER tags:article:1 tags:article:3

# Unión:
$REDIS SUNION tags:article:1 tags:article:2

# Diferencia:
$REDIS SDIFF tags:article:1 tags:article:2

# ------------------------------------------------------------
echo ""
echo ">>> Paso 3 — Sorted Sets (leaderboard)"
# ------------------------------------------------------------

$REDIS ZADD leaderboard 950 h4x0rjimduggan
$REDIS ZADD leaderboard 850 pitythefool
$REDIS ZADD leaderboard 720 alice
$REDIS ZADD leaderboard 1100 redismaster
$REDIS ZADD leaderboard 430 newbie

# Rango ascendente:
$REDIS ZRANGE leaderboard 0 -1

# Top 3 descendente con scores:
$REDIS ZREVRANGE leaderboard 0 2 WITHSCORES

# Score de un miembro:
$REDIS ZSCORE leaderboard h4x0rjimduggan

# Posición en el ranking:
$REDIS ZRANK leaderboard h4x0rjimduggan
$REDIS ZREVRANK leaderboard h4x0rjimduggan

# Miembros con score entre 800 y 1000:
$REDIS ZRANGEBYSCORE leaderboard 800 1000 WITHSCORES

# Incrementar score:
$REDIS ZINCRBY leaderboard 200 alice
$REDIS ZREVRANGE leaderboard 0 -1 WITHSCORES

# ------------------------------------------------------------
echo ""
echo ">>> Paso 4 — Hashes (objetos estructurados)"
# ------------------------------------------------------------

$REDIS HSET user:1:profile name Alice age 30 city "Buenos Aires" role admin

# Obtener un campo:
$REDIS HGET user:1:profile name

# Obtener todos los campos:
$REDIS HGETALL user:1:profile

# Solo keys o solo values:
$REDIS HKEYS user:1:profile
$REDIS HVALS user:1:profile

# Verificar si un campo existe:
$REDIS HEXISTS user:1:profile email

# Agregar un campo:
$REDIS HSET user:1:profile email alice@example.com
$REDIS HGETALL user:1:profile

# Eliminar un campo:
$REDIS HDEL user:1:profile role
$REDIS HGETALL user:1:profile

# Incrementar campo numérico:
$REDIS HSET user:1:profile login_count 0
$REDIS HINCRBY user:1:profile login_count 1
$REDIS HGET user:1:profile login_count

echo ""
echo "===================================="
echo " Día 2 completado"
echo "===================================="
