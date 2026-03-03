"""
Ejercicio 5
Implementar un algoritmo que dado los Trie T1 y T2 devuelva True si estos pertenecen al mismo documento y False en caso contrario. Se considera que un  Trie pertenece al mismo documento cuando:
Ambos Trie sean iguales (esto se debe cumplir)
El Trie T1 contiene un subconjunto de las palabras del Trie T2 
Si la implementación está basada en LinkedList, considerar el caso donde las palabras hayan sido insertadas en un orden diferente.

En otras palabras, analizar si todas las palabras de T1 se encuentran en T2. 

Analizar el costo computacional.
"""

import trie as T

def comp_trie (t1 : T.Trie, t2 : T.Trie):

    words_t1 = extract_words(t1)

    for word in words_t1:
        T.delete(t1, word)
        T.delete(t2, word)
    
    if t1.root.children == [] and t2.root.children == []: 
        return True
    else:
        return False

"""------------------------------------------------------------------------------------------------"""

def extract_words(trie : T.Trie) : 

    words = []
    stack = [(trie.root, "")]

    while stack: 
        node, word = stack.pop()
        for child in node.children:
            new_word = word + child.key
            if child.isEndOfWord:
                words.append(new_word)
            stack.append((child, new_word))
    return words

"""------------------------------------------------------------------------------------------------"""
    
# Crear trie
trie = T.Trie()

# Insertar palabras
words_to_insert = [
    # Prefijo "cat", longitud 5
    "cabin", "candy", "cable", "capon", "caper", "carve", "catch", "cater", "catty", "cavil", "caperi",  # <-- nueva palabra
    
    # Prefijo "dog", longitud 5
    "dodge", "doggy", "dolor", "dough", "dowel", "dummy", "dandy", "digit", "donut", "dingo", "dogma",  # <-- nueva palabra
    
    # Prefijo "app", longitud 5
    "apple", "apply", "apart", "apron", "appel", "aptly", "abuse", "argue", "amber", "axial",
    
    # Prefijo "car", longitud 6
    "carbon", "carrot", "career", "carver", "carton", "carmen", "cabman", "cartel", "carnal", "carmen",
    
    # Prefijo "sun", longitud 6
    "sunday", "sundry", "sunset", "suntan", "sunder", "sunnah", "sunken", "sunlit", "sunned", "sunbow",
    
    # Prefijo "rain", longitud 6
    "raisin", "rained", "railer", "raisee", "raider", "railer", "ransom", "random", "ranged", "ranger",
    
    # Prefijo "blu", longitud 6
    "bluesy", "bluish", "blurry", "bluing", "bluest", "bluing", "bludge", "bluffa", "blucher", "blunts",
    
    # Prefijo "star", longitud 6
    "stared", "starch", "starky", "starry", "starve", "starter", "stasis", "stanza", "staple", "staply"
]
for word in words_to_insert:
    T.insert(trie, word)

"""------------------------------------------------------------------------------------------------------------------------------------------"""

# Crear trie
trie2 = T.Trie()

# Insertar palabras (casi idénticas al primer trie, salvo 2 cambios)
words_to_insert2 = [
    # Prefijo "cat", longitud 5
    "cabin", "candy", "cable", "capon", "caper", "carve", "catch", "cater", "catty", "cavil", "caperi",  # <-- nueva palabra
    
    # Prefijo "dog", longitud 5
    "dodge", "doggy", "dolor", "dough", "dowel", "dummy", "dandy", "digit", "donut", "dingo", "dogma",  # <-- nueva palabra
    
    # Prefijo "app", longitud 5
    "apple", "apply", "apart", "apron", "appel", "aptly", "abuse", "argue", "amber", "axial",
    
    # Prefijo "car", longitud 6
    "carbon", "carrot", "career", "carver", "carton", "carmen", "cabman", "cartel", "carnal", "carmen",
    
    # Prefijo "sun", longitud 6
    "sunday", "sundry", "sunset", "suntan", "sunder", "sunnah", "sunken", "sunlit", "sunned", "sunbow",
    
    # Prefijo "rain", longitud 6
    "raisin", "rained", "railer", "raisee", "raider", "railer", "ransom", "random", "ranged", "ranger",
    
    # Prefijo "blu", longitud 6
    "bluesy", "bluish", "blurry", "bluing", "bluest", "bluing", "bludge", "bluffa", "blucher", "blunts",
    
    # Prefijo "star", longitud 6
    "stared", "starch", "starky", "starry", "starve", "starter", "stasis", "stanza", "staple", "staply"
]

# Insertar en el trie
for word in words_to_insert2:
    T.insert(trie2, word)

print(extract_words(trie))