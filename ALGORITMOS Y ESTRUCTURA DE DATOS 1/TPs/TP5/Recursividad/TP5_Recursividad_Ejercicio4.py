from mylinkedlist import *

def sortList(list : LinkedList, start = 0):
    length = lengthList(list)
    if start == length - 1 :
        return 
    else :
        min_index = start
        min_value = access(list, start)
        for i in range (start + 1, length):
            if access(list, i) < min_value :
                min_value = access(list, i)
                min_index = i
        if min_index != start :
            move(list, min_index, start)
        sortList(list, start + 1)
        
        
list = LinkedList()
add(list, 58)
add(list, 12)
add(list, 73)
add(list, 4)
add(list, 89)
add(list, 31)
add(list, 66)
add(list, 25)
showList(list)
sortList(list,0)
showList(list)
        
