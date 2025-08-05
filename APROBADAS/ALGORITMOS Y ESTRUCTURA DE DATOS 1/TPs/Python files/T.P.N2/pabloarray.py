def out_of_range(index, start, end):

    if index < start or index >= end:
        return True
    else:
        return False
    
def access(array, position):     #3
    
    return array[position]       #3


def search(array, element):  #3

    encontrado = False  #1
    for i in range(0,len(array)):  #1 OE + 5n 

        if array[i] == element:  #2n
            return i  #2/

    
    if encontrado == False: return None  #3

       

def insert(array, element, index):  #4

    if out_of_range(index, 0, len(array)):  #7 + 5 (Out of range)
        return None  #2  Total = 2
    
    else:

        for i in range(len(array)-1,index,-1):  #4 + 3n

            array[i] = array[i-1]  #4n
        
        array[index] = element  #2  Total = 6 + 7n -> Winner
          
def delete(array,element):  #3

    encontrado = False  #1

    for i in range(0,len(array)):  #1 + 5n
        if array[i] == element:  #2n
            encontrado = True  #1n
            index = i  #1n
            
    if encontrado:  #1
        for i in range(index,len(array)-2):  #2 + 4n
            array[i] = array[i+1]  #4n
        array[len(array)-1] = None  #5
        return index  #2/
    else: 
        return None
                    
def length(array):
    
    contador = 0
    for i in range(0,len(array)):
        if array[i] != None:
            contador = contador + 1    
        return contador