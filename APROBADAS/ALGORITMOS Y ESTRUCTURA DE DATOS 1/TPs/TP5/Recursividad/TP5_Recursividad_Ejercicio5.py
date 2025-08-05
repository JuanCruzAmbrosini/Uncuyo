from mystack import *
def stack_fibo(n):
    stack = LinkedList()
    push(stack, 0)
    if n == 0 :
        return 0
    push(stack, 1)
    if n == 1 :
        return 1
    for i in range (2, n + 1):
        push(stack, (stack.head.value + stack.head.nextNode.value))
    return pop(stack)
    
print(stack_fibo(0))
print(stack_fibo(1))
print(stack_fibo(2))
print(stack_fibo(3))
print(stack_fibo(4))
print(stack_fibo(5))
print(stack_fibo(6))
print(stack_fibo(7))
print(stack_fibo(8))
print(stack_fibo(9))
print(stack_fibo(10))
print(stack_fibo(11))
print(stack_fibo(12))