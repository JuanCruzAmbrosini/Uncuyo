class AVL_node:
    def __init__(self, key, bf=0, value = None):
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

    calculate_balance_r(new_root)
    
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

    calculate_balance_r(new_root)
    
    return new_root

""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - """    

def rotate_right(tree : AVL_tree, node : AVL_node):

    if node.left_node.bf < 0:
            rotate_left_aux(tree, node.left_node)
    rotate_right_aux(tree, node)

"""--------------------------------------------------------------------------------------------------------------------------------------"""  

def calculate_balance(tree : AVL_tree):

    if tree.root == None:
        print("El arbol no tiene raiz.")
        return 
    else :
        calculate_balance_r(tree.root)
        
""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - """   

def calculate_balance_r(current : AVL_node):

    if current == None:
        return 0 
    
    left_height = calculate_balance_r(current.left_node)
    right_height = calculate_balance_r(current.right_node)
    current.bf = left_height - right_height

    return 1 + max(left_height, right_height)
    
"""--------------------------------------------------------------------------------------------------------------------------------------"""    

def rebalance(tree : AVL_tree):

    rebalance_r(tree, tree.root)

""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - """ 

def rebalance_r(tree : AVL_tree, node : AVL_node):

    if node == None:
        return
    
    flag = True
    
    rebalance_r(tree, node.left_node)
    rebalance_r(tree, node.right_node)

    calculate_balance_r(node)

    if node.bf < -1 :
        rotate_left(tree, node)
    
    if node.bf > 1:
        rotate_right(tree, node)

    
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

def insert (tree : AVL_tree, key : int, value):

    node : AVL_node = AVL_node(key, value = value)
    parent : AVL_node = None
    #Caso de que el arbol no tenga raiz
    if tree.root == None:
        tree.root = node
        return key
    
    #Caso de que si tenga raiz
    current : AVL_node = tree.root
    while current != None:

        parent = current

        if key == current.key:
            return "Err"
        
        elif key > current.key :
            current = current.right_node

        else:
            current = current.left_node
        
    if parent.key < key : 
        parent.right_node = node
        node.parent = parent

    else:
        parent.left_node = node
        node.parent = parent

    calculate_balance(tree)
    rebalance(tree)

    return key

"""--------------------------------------------------------------------------------------------------------------------------------------""" 

def delete_key(tree : AVL_tree, key : int  = 0):

    key = int(input("Ingrese la llave "))

    #Buscamos el nodo a eliminar
    d_node = search_key(tree, key)

    if d_node != None:

        ret_key = d_node.key

        #Caso de que el nodo a eliminar no tenga hijos
        if d_node.left_node == None and d_node.right_node == None :

            #Raiz
            if tree.root == d_node:
                tree.root = None
                rebalance(tree)
                return ret_key
            
            parent : AVL_node = d_node.parent

            #Hijo izquierdo
            if parent.key > d_node.key:
                parent.left_node = None
                d_node.parent = None
                rebalance(tree)
                return ret_key
            
            #Hijo derecho
            else:
                parent.right_node = None
                d_node.parent = None
                rebalance(tree)
                return ret_key

        # Caso de que el nodo a eliminar tenga un solo hijo (izquierdo)
        if d_node.left_node and d_node.right_node == None:

            # Raíz
            if tree.root == d_node:
                tree.root = d_node.left_node
                d_node.left_node.parent = None
            else:
                parent: AVL_node = d_node.parent

                # Seleccionar si va a left_node o right_node
                if parent.key > d_node.key:
                    parent.left_node = d_node.left_node
                else:
                    parent.right_node = d_node.left_node

                d_node.left_node.parent = parent

            # Limpieza de referencias
            d_node.left_node = None
            d_node.parent = None

            rebalance(tree)

            return ret_key
        
        # Caso de que el nodo a eliminar tenga un solo hijo (derecho)
        if d_node.left_node == None and d_node.right_node :

            # Raíz
            if tree.root == d_node:
                tree.root = d_node.right_node
                d_node.right_node.parent = None
            else:

                parent: AVL_node = d_node.parent

                # Seleccionar si va a left_node o right_node
                if parent.key > d_node.key:
                    parent.left_node = d_node.right_node
                else:
                    parent.right_node = d_node.right_node

                d_node.right_node.parent = parent

            # Limpieza de referencias
            d_node.right_node = None
            d_node.parent = None

            rebalance(tree)
            return ret_key
        
        # Caso de que el nodo a eliminar tenga dos hijos

        if d_node.right_node and d_node.left_node :

            inorder_node : AVL_node = search_inorder_succesor(d_node)
            succ_parent : AVL_node = inorder_node.parent


            #Hijo izquierdo
            if succ_parent.key > inorder_node.key and succ_parent:
                succ_parent.left_node = None
                inorder_node.parent = None
            
            #Hijo derecho
            else:
                succ_parent.right_node = None
                inorder_node.parent = None

            if d_node.parent == None:
                tree.root = inorder_node
                inorder_node.left_node = d_node.left_node
                inorder_node.right_node = d_node.right_node
                if inorder_node.left_node != None:
                    inorder_node.left_node.parent = inorder_node
                if inorder_node.right_node != None:
                    inorder_node.right_node.parent = inorder_node
                d_node = None
                return ret_key
            else:
                if inorder_node == d_node.right_node:
                    if d_node.parent.left_node == d_node:
                        d_node.parent.left_node = inorder_node
                    else:
                        d_node.parent.right_node = inorder_node
                    inorder_node.parent = d_node.parent
                    inorder_node.left_node = d_node.left_node
                    if inorder_node.left_node != None:
                        inorder_node.left_node.parent = inorder_node
                    d_node.left_node = d_node.right_node = d_node.parent = None
                else:
                    inorder_node.right_node = d_node.right_node
                    inorder_node.left_node = d_node.left_node
                    inorder_node.parent = d_node.parent
                    if d_node.parent.left_node == d_node:
                        d_node.parent.left_node = inorder_node
                    if d_node.parent.right_node == d_node:
                        d_node.parent.right_node = inorder_node
                    d_node = None
            rebalance(tree)
            return ret_key
    else:
        return "Err"
"""--------------------------------------------------------------------------------------------------------------------------------------""" 
# ==== Funcion para imprimir el arbol (en orden) ====
def print_tree(node : AVL_node, level = 0, prefix = ""):
    if node != None : 
        print_tree(node.right_node, level + 1, prefix + "      ")
        print(prefix + "|--" + str(node.value) + "." + str(node.key) + "." + str(node.bf))
        print_tree(node.left_node, level + 1, prefix + "      ")

tree = AVL_tree()

n50 = AVL_node(50, bf=2)
n40 = AVL_node(40, bf=1)
n45 = AVL_node(45, bf=0)
n30 = AVL_node(30, bf=1)
n42 = AVL_node(42, bf=0)
n20 = AVL_node(20, bf=0)
n35 = AVL_node(35, bf=0)
n10 = AVL_node(10, bf=0)

tree.root = n50

# Hijo izquierdo y derecho de 50
n50.left_node = n40
n40.parent = n50

n50.right_node = n45
n45.parent = n50

# Hijos de 40
n40.left_node = n30
n30.parent = n40

n40.right_node = n42
n42.parent = n40

# Hijos de 30
n30.left_node = n20
n20.parent = n30

n30.right_node = n35
n35.parent = n30

# Hijo izquierdo de 20
n20.left_node = n10
n10.parent = n20

print("--------------------------------------------------")
print("Arbol base")
print_tree(tree.root)

print("--------------------------------------------------")
print("Prueba delete")
rebalance(tree)
delete_key(tree, 30)
print_tree(tree.root)



"""    # Buscamos el nodo a eliminar
    d_node = search_key(tree, key)

    if d_node is None:
        return "Err"

    ret_key = d_node.key
    parent = d_node.parent

    # Caso 1: Nodo sin hijos
    if d_node.left_node is None and d_node.right_node is None:

        if parent is None:
            # El nodo es la raíz y es hoja
            tree.root = None
        else:
            if parent.left_node == d_node:
                parent.left_node = None
            else:
                parent.right_node = None
            d_node.parent = None

        rebalance(tree)
        return ret_key

    # Caso 2: Nodo con un solo hijo
    if d_node.left_node is None or d_node.right_node is None:
        child = d_node.left_node if d_node.left_node else d_node.right_node
        child.parent = parent

        if parent is None:
            # El nodo es la raíz
            tree.root = child
        else:
            if parent.left_node == d_node:
                parent.left_node = child
            else:
                parent.right_node = child

        d_node.parent = None
        d_node.left_node = None
        d_node.right_node = None

        rebalance(tree)
        return ret_key

    # Caso 3: Nodo con dos hijos
    # Encontrar sucesor inorder
    inorder_node = search_inorder_succesor(d_node)
    if inorder_node is None:
        # Esto no debería pasar si tiene dos hijos
        return "Err"

    # Copiar clave y valor del sucesor al nodo a eliminar
    d_node.key = inorder_node.key
    d_node.value = inorder_node.value

    # Eliminar el sucesor (que tiene 0 o 1 hijo)
    # Importante: eliminar inorder_node desde su padre
    succ_parent = inorder_node.parent

    # Caso sucesor es hijo izquierdo o derecho
    if succ_parent.left_node == inorder_node:
        succ_parent.left_node = inorder_node.right_node
        if inorder_node.right_node:
            inorder_node.right_node.parent = succ_parent
    else:
        succ_parent.right_node = inorder_node.right_node
        if inorder_node.right_node:
            inorder_node.right_node.parent = succ_parent

    inorder_node.parent = None
    inorder_node.left_node = None
    inorder_node.right_node = None

    rebalance(tree)
    return ret_key"""