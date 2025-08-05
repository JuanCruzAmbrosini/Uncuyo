import unittest

class Node:
    def __init__(self):
        self.value = None
        self.nextNode = None

class LinkedList:
    def __init__(self):
        self.head = None

def lengthList(lst):
    count = 0
    current = lst.head
    while current:
        count += 1
        current = current.nextNode
    return count

def add(lst, element):
    new_node = Node()
    new_node.value = element
    new_node.nextNode = lst.head
    lst.head = new_node

def insert(lst, element, index):
    if lengthList(lst) < index:
        return None
    else:
        current_node = lst.head
        new_node = Node()
        new_node.value = element
        if index == 0:
            add(lst, element)
            return index
        else: 
            for i in range(1, lengthList(lst) + 1):
                if i == index:
                    new_node.nextNode = current_node.nextNode
                    current_node.nextNode = new_node
                    break
                current_node = current_node.nextNode
            return index

def move(lst, pos_from, pos_to):
    length = lengthList(lst)
    if lst.head is None:
        return None
    if pos_from < 0 or pos_from > length - 1 or pos_to < 0 or pos_to > length - 1:
        return None

    current = lst.head
    prev_node = None
    counter = 0

    while current is not None:
        if counter == pos_from:
            aux_node = current
            if prev_node is None:
                lst.head = current.nextNode
            else:
                prev_node.nextNode = current.nextNode
            break
        prev_node = current
        current = current.nextNode
        counter += 1

    insert(lst, aux_node.value, pos_to)

def to_list(lst):
    result = []
    current = lst.head
    while current:
        result.append(current.value)
        current = current.nextNode
    return result

class TestMoveFunction(unittest.TestCase):
    def test_move_middle(self):
        l = LinkedList()
        for value in reversed([1, 2, 3, 4]):
            add(l, value)  # Lista: [1, 2, 3, 4]
        move(l, 1, 2)       # Mover el 2 a la posición 2 → [1, 3, 2, 4]
        self.assertEqual(to_list(l), [1, 3, 2, 4])

    def test_move_to_start(self):
        l = LinkedList()
        for value in reversed([10, 20, 30]):
            add(l, value)  # Lista: [10, 20, 30]
        move(l, 2, 0)      # Mover el 30 al principio → [30, 10, 20]
        self.assertEqual(to_list(l), [30, 10, 20])

    def test_move_to_end(self):
        l = LinkedList()
        for value in reversed([1, 2, 3]):
            add(l, value)  # Lista: [1, 2, 3]
        move(l, 0, 2)      # Mover el 1 al final → [2, 3, 1]
        self.assertEqual(to_list(l), [2, 3, 1])

    def test_move_invalid_index(self):
        l = LinkedList()
        for value in reversed([1, 2, 3]):
            add(l, value)
        move(l, -1, 1)     # Índice inválido
        self.assertEqual(to_list(l), [1, 2, 3])
        move(l, 1, 5)      # Otro índice inválido
        self.assertEqual(to_list(l), [1, 2, 3])

if __name__ == "__main__":
    unittest.main()