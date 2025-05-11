from algo1 import *

def fibo (n):
    if n == 0:
        return 0
    if n == 1:
        return 1
    n1 = fibo(n-1)
    n2 = fibo(n-2)
    return (n1 + n2)

print(fibo(0))
print(fibo(1))
print(fibo(12))