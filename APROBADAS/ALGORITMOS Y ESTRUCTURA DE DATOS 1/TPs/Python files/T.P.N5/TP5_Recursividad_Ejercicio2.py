def firstIntegers(n):
    sum = 0
    if n == 0:
        return 0
    if n == 1 :
        return 1
    return (n + firstIntegers(n-1))

print(firstIntegers(10))