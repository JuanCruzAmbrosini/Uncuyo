def recursive_even_add(n):
    if n < 2:
        print("El valor ingresado tiene que ser mayor que 2.")
        return None
    elif(n == 2):
        return 2
    else:
        if n % 2 != 0 :
            print(n,"es impar.")
            return recursive_even_add(n-1)
        else:
            return n + recursive_even_add(n-2)

print("La suma de todos los enteros pares antes de 10 es: ", recursive_even_add(10))