class BTreeNode:
    def __init__(self, t, leaf=False, keys = [], parent = None):
        self.t = t  # Grado mínimo (mínimo número de claves)
        self.leaf = leaf  # True si el nodo es hoja
        self.keys = keys  # Lista de claves
        self.children = []  # Lista de hijos
        self.parent = parent

class BTree:
    def __init__(self, t):
        self.t = t
        self.root = BTreeNode(t, leaf=True)
        
"""----------------------------------------------------------------"""

def search (btree : BTree, key : int, is_search : bool = True) : 
    
    current = btree.root
    
    if key in current.keys : 
        return current, True
    
    while True: 
        size = len(current.keys) 
        if key < current.keys[0] and current.children != [] : 
            current = current.children[0]
            continue
        if key > current.keys[size-1] and current.children != [] :
            current = current.children[size]
            continue
        for i in range (1, size) : 
            if key > current.keys[i-1] and key < current.keys[i] and current.children != [] :
                current = current.children[i]
                break
            
        if key in current.keys : 
            return current, True
        
        if current.children == [] : 
            if is_search : 
                return None, False
            else: 
                return current
            
"""----------------------------------------------------------------"""

def insert (b_tree : BTree, key : int):
    
    insert_node : BTreeNode = b_tree.root
    t = b_tree.t
    
    #Caso hoja
    insert_node : BTreeNode = search(btree, key, False) 
    if isinstance(insert_node, tuple):
        print("Esa llave ya existe.")
        return 

    #Caso sin split
    if len(insert_node.keys) < (2 * t) - 1: 
        insert_in_order_list(insert_node.keys, key)
        return
        
    #Caso con split
    else :  
        current = insert_node
        while True:
            
            splited_node = split(current, t)
            
            first = splited_node[0]
            mid_val = splited_node[1]
            second = splited_node[2]
            
            if key < mid_val:
                insert_in_order_list(first, key)
            else:
               insert_in_order_list(second, key)
            
            new_node_a : BTreeNode = BTreeNode(t, current.leaf, first) 
            new_node_b : BTreeNode = BTreeNode(t, current.leaf, second)
            
            if not current.leaf:
                mid = len(current.keys) // 2
                new_node_a.children = current.children[:mid+1]
                new_node_b.children = current.children[mid+1:]
                for c in new_node_a.children:
                    c.parent = new_node_a
                for c in new_node_b.children:
                    c.parent = new_node_b
            
            if current.parent :
                new_node_a.parent = current.parent
                new_node_b.parent = current.parent
                
                current.parent.children.remove(current)
                insert_in_order_node(current.parent.children, new_node_a)
                insert_in_order_node(current.parent.children, new_node_b)
                
                
                if len(new_node_a.parent.keys) < (2 * t) - 1 :
                    insert_in_order_list(new_node_a.parent.keys, mid_val)
                    return
                
                else:
                    current = new_node_a.parent
                    key = mid_val
            
            else:
                new_root = BTreeNode(t, False, [mid_val])
                new_root.children = [new_node_a, new_node_b]
                new_node_a.parent = new_root
                new_node_b.parent = new_root
                b_tree.root = new_root
                return
                    
"""----------------------------------------------------------------"""

def split (node : BTreeNode, t : int):
    
    if node is None: 
        return -1
    
    first_part = node.keys[: t - 1]
    middle_part = node.keys [t-1]
    second_part = node.keys [t :]    
    
    return first_part, middle_part, second_part

"""----------------------------------------------------------------"""

def insert_in_order_list(list : list, key): 
    
    for i in range (0, len(list)):
                
        if list[i] > key :
                    
            list.insert(i, key)
            return 1
        
    list.append(key)

"""----------------------------------------------------------------"""

def insert_in_order_node(lst: list, node : BTreeNode): 
    
    sub_list_size = len(node.keys)
    list_size = len(lst)
    
    if lst[0].keys[0] > node.keys[sub_list_size - 1] : 
        lst.insert(0, node)
        return 1
    
    if lst[- 1].keys[- 1] < node.keys[0]: 
        lst.append(node)
        return 1
    
    for i in range(1, list_size ):
        if lst[i-1].keys[- 1] < node.keys[0] and lst[i].keys[0] > node.keys[- 1] : 
            lst.insert(i, node)
            return 1

"""----------------------------------------------------------------"""

# Hardcodeamos un B-Tree de grado mínimo t=2

# --- Hardcode del BTree (t = 2) ---
# Raíz
root = BTreeNode(2, leaf=False, keys=[10, 20])

# Hijos de la raíz
child1 = BTreeNode(2, leaf=True, keys=[5, 7], parent=root)
child2 = BTreeNode(2, leaf=True, keys=[12, 15], parent=root)
child3 = BTreeNode(2, leaf=True, keys=[22, 25, 30], parent=root)

# Conectar los hijos con la raíz
root.children = [child1, child2, child3]

# Crear el árbol y asignar la raíz
btree = BTree(2)
btree.root = root


# Función para imprimir el BTree
def print_btree(node, prefix="", is_last=True):
    """Imprime el B-Tree en forma de árbol jerárquico."""
    if node is not None:
        # Prefijo con ramas
        connector = "└── " if is_last else "├── "
        print(prefix + connector + str(node.keys))

        # Nuevo prefijo para los hijos
        new_prefix = prefix + ("    " if is_last else "│   ")

        # Recorremos los hijos
        for i, child in enumerate(node.children):
            is_last_child = (i == len(node.children) - 1)
            print_btree(child, new_prefix, is_last_child)


# Ejemplo de uso
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 0)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 9)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 18)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 35)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 1)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 2)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 3)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 23)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 21)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 51)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 14)
print("-------------------------------------------------------")
print_btree(btree.root)
insert(btree, 105)
print("-------------------------------------------------------")
print_btree(btree.root)
var = search(btree, 25)

print(var[0].keys)
print(var[1]) 
