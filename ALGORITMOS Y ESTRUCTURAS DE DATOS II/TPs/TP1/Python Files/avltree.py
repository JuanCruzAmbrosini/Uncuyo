class AVL_node:
    def __init__(self, key, bf=0, value = None, height = 0):
        self.height = height
        self.value = value
        self.key = key
        self.bf = bf
        self.left_node = None
        self.right_node = None
        self.parent = None

class AVL_tree:
    def __init__(self):
        self.root = None
    

def rotate_left_aux(tree : AVL_tree, node : AVL_node):
    
    new_root : AVL_node = node.right_node
    parent : AVL_node = node.parent
    #Caso de que node no tenga padre
    if parent == None:
        tree.root = new_root
        new_root.parent = None
    else:
    #Caso de que node sea un hijo derecho
        if parent.right_node == node:
            #Cambio el vinculo entre el pardre de node y se lo doy a new_root
            parent.right_node = new_root
            new_root.parent = parent
        #Caso de que node sea un hijo izquierdo
        if parent.left_node == node:
            #Cambio el vinculo entre el pardre de node y se lo doy a new_root
            parent.left_node = new_root
            new_root.parent = parent
        
    #Caso de que el new_root tenga un sub-arbol izquierdo
    node.right_node = new_root.left_node
    if new_root.left_node != None:
        #Reasigno el arbol izquierdo de new_root y se lo coloco a node
        node.right_node.parent = node
        
    #Ahora hacemos la rotacion
    new_root.left_node = node
    node.parent = new_root

    calculate_bf_height(node)
    calculate_bf_height(new_root)
    
    return new_root
""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - """  

def rotate_left(tree : AVL_tree, node : AVL_node):

    if node.right_node and node.right_node.bf > 0:
        rotate_right_aux(tree, node.right_node)
    rotate_left_aux(tree, node)

"""--------------------------------------------------------------------------------------------------------------------------------------"""    

def rotate_right_aux(tree : AVL_tree, node : AVL_node):
        
    new_root : AVL_node = node.left_node
    parent : AVL_node = node.parent
    #Caso de que node no tenga padre
    if parent == None:
        tree.root = new_root
        new_root.parent = None
    else:
    #Caso de que node sea un hijo derecho
        if parent.right_node == node:
            #Cambio el vinculo entre el pardre de node y se lo doy a new_root
            parent.right_node = new_root
            new_root.parent = parent
        #Caso de que node sea un hijo izquierdo
        if parent.left_node == node:
            #Cambio el vinculo entre el pardre de node y se lo doy a new_root
            parent.left_node = new_root
            new_root.parent = parent
        
    #Caso de que el new_root tenga un sub-arbol derecho
    node.left_node = new_root.right_node
    if new_root.right_node != None:
        #Reasigno el arbol derecho de new_root y se lo coloco a node
        node.left_node.parent = node
        
    #Ahora hacemos la rotacion
    new_root.right_node = node
    node.parent = new_root

    calculate_bf_height(node)
    calculate_bf_height(new_root)

    return new_root
""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - """    

def rotate_right(tree : AVL_tree, node : AVL_node):

    if node.left_node.bf < 0:
            rotate_left_aux(tree, node.left_node)
    rotate_right_aux(tree, node)

"""--------------------------------------------------------------------------------------------------------------------------------------"""  

def calculate_bf_height (node : AVL_node) :

    if node is not None:

        left_h = node.left_node.height if node.left_node else -1
        right_h = node.right_node.height if node.right_node else -1

        node.height = 1 + max(left_h, right_h)
        node.bf = left_h - right_h
        
"""--------------------------------------------------------------------------------------------------------------------------------------""" 

def rebalance(tree : AVL_tree, node : AVL_node):

    flag = False
    
    while node != None :
        calculate_bf_height(node)

        if node == tree.root : 
            flag = True

        if node.bf > 1 : 
            rotate_right(tree, node)
        if node.bf < -1 :
            rotate_left(tree, node)

        calculate_bf_height(node)

        if flag : 
            break

        node = node.parent

"""--------------------------------------------------------------------------------------------------------------------------------------"""

def search_key_r(current : AVL_node, key):
    if current == None:
        return None
    if current.key == key:
        result = current
    elif current.key > key:
        result = search_key_r(current.left_node, key)
    else :
        result = search_key_r(current.right_node, key)
    return result

def search_key (tree : AVL_tree, key : int):
    if tree.root == None:
        return None
    else:
        return search_key_r(tree.root, key)

"""--------------------------------------------------------------------------------------------------------------------------------------""" 

def search_inorder_succesor(node : AVL_node):
    if node.right_node != None:
        node = node.right_node
        while node.left_node != None:
            node = node.left_node
        return node
    parent : AVL_node = node.parent
    while parent != None and parent.right_node == node:
        node = parent
        parent = parent.parent
    return parent

"""--------------------------------------------------------------------------------------------------------------------------------------""" 

def insert_r(tree, current : AVL_node, element, key):
    if key < current.key:
        if current.left_node == None:
            new_node = AVL_node(key, value = element)
            new_node.parent = current
            current.left_node = new_node
            calculate_bf_height(new_node)
            rebalance(tree, new_node)
            return key
        else : 
            return insert_r(tree, current.left_node, element, key)
    elif key > current.key:
        if current.right_node == None:
            new_node = AVL_node(key, value = element)
            new_node.parent = current
            current.right_node = new_node
            calculate_bf_height(new_node)
            rebalance(tree, new_node)
            return key
        else : 
            return insert_r(tree, current.right_node, element, key)
    else:
        return None

def insert (tree : AVL_tree, element, key : int):
        if tree.root == None:
            new_root = AVL_node
            new_root.key = key
            new_root.value = element
            tree.root = new_root
            return key
        else:
            current = tree.root
            return insert_r(tree, current, element, key)

"""--------------------------------------------------------------------------------------------------------------------------------------"""        

def delete (tree : AVL_tree, key : int = 0):

    d_node : AVL_node = search_key(tree, key)

    if d_node is None:
        return "Err"
    
    #Caso sin hijos
    if d_node.left_node is None and d_node.right_node is None:

        parent = d_node.parent

        if parent is None:
            tree.root = None

            return

        if parent.key > key:
            d_node.parent.left_node = None
        else :
            d_node.parent.right_node = None
        d_node.parent = None

        calculate_bf_height(parent)
        rebalance(tree, parent)

        return

    #Caso con un hijo izquierdo

    if d_node.left_node is not None and d_node.right_node is None:
        parent : AVL_node = d_node.parent

        if parent is None:
            tree.root = d_node.left_node
            d_node.left_node.parent = None
            d_node.left_node = None

            calculate_bf_height(tree.root)
            rebalance(tree, tree.root)

            return

        if parent.key > key:
            parent.left_node = d_node.left_node
        else:
            parent.right_node = d_node.left_node
        d_node.left_node.parent = parent
        d_node.parent = None
        d_node.left_node = None

        calculate_bf_height(parent)
        rebalance(tree, parent)

        return

    #Caso con un hijo derecho
    if d_node.left_node is None and d_node.right_node is not None:
        parent : AVL_node = d_node.parent

        if parent is None:
            tree.root = d_node.right_node
            d_node.right_node.parent = None
            d_node.right_node = None

            calculate_bf_height(tree.root)
            rebalance(tree, tree.root)
            
            return
        
        if parent.key > key:
            parent.left_node = d_node.right_node
        else:
            parent.right_node = d_node.right_node

        d_node.right_node.parent = parent
        d_node.parent = None
        d_node.right_node = None

        calculate_bf_height(parent)
        rebalance(tree, parent)

        return
    
    #Caso con 2 hijos: 
    if d_node.right_node is not None and d_node.left_node is not None:

        parent : AVL_node = d_node.parent
        succ = search_inorder_succesor(d_node)
        succ_parent : AVL_node = succ.parent
        succ_child : AVL_node = succ.right_node

        #Caso de que el succ sea el sucesor inmediato de d_node
        if d_node.right_node == succ:

            if parent:

                if parent.key > key:
                    parent.left_node = succ
                else:
                    parent.right_node = succ

                succ.parent = d_node.parent

            else: 

                tree.root = succ
                succ.parent = None

            succ.left_node = d_node.left_node
            succ.left_node.parent = succ
        
        else : 

            if succ_child : 
                
                if succ_parent.right_node == succ:
                    succ_parent.right_node = succ_child

                elif succ_parent.left_node == succ:

                    succ_parent.left_node = succ_child 
                    succ_child.parent = succ_parent
                    
            if tree.root != d_node:

                if parent.key > key:
                    parent.left_node = succ
                else:
                    parent.right_node = succ

                succ.parent = d_node.parent

            else: 

                tree.root = succ
                succ.parent = None

            succ.right_node = d_node.right_node
            succ.left_node = d_node.left_node

            succ.right_node.parent = succ
            succ.left_node.parent = succ

            succ_parent.left_node = None

        d_node.parent = None
        d_node.left_node = None
        d_node.right_node = None

        calculate_bf_height(succ)
        rebalance(tree, succ)

        return

"""--------------------------------------------------------------------------------------------------------------------------------------"""     

# ==== Funcion para imprimir el arbol (en orden) ====
def print_tree(node : AVL_node, level = 0, prefix = ""):
    if node != None : 
        print_tree(node.right_node, level + 1, prefix + "      ")
        print(prefix + "|--" + str(node.value) + "." + str(node.key) + "." + str(node.bf) + ".L" + str(node.height))
        print_tree(node.left_node, level + 1, prefix + "      ")


tree = AVL_tree()

# Crear nodos con value (letra), key, bf y height hardcodeados (AVL válido)

n20 = AVL_node(20, bf=0, value='T', height=2)
n10 = AVL_node(10, bf=0, value='J', height=1)
n30 = AVL_node(30, bf=0, value='C', height=1)
n5  = AVL_node(5,  bf=0, value='E', height=0)
n15 = AVL_node(15, bf=0, value='O', height=0)
n25 = AVL_node(25, bf=0, value='Y', height=0)
n35 = AVL_node(35, bf=0, value='Z', height=0)

# Conexiones

tree.root = n20

n20.left_node = n10
n10.parent = n20

n20.right_node = n30
n30.parent = n20

n10.left_node = n5
n5.parent = n10

n10.right_node = n15
n15.parent = n10

n30.left_node = n25
n25.parent = n30

n30.right_node = n35
n35.parent = n30

# Prueba 3: eliminar nodos en orden aleatorio para reequilibrios impredecibles
print("--------------------------------------------------")
print("Arbol base")
print_tree(tree.root)

for key in [20, 5, 30, 15, 25, 10, 35]:
    print("--------------------------------------------------")
    print("Prueba delete")
    delete(tree, key)
    print_tree(tree.root)