import trie as T

"""Ejercicio 4
Implementar un algoritmo que dado un árbol Trie T, un patrón p (prefijo) y un entero n, escriba todas las palabras del árbol que empiezan por p y sean de longitud n. """

def all_words(trie : T.Trie, prefix : str, n : int):

    if len(prefix) > n :
        return -1
    
    last_pref : T.TrieNode = search_prefix(trie, prefix)
    relative_n = n - len(prefix) 

    if last_pref == -1:
        return -1
    
    if last_pref.isEndOfWord and len(prefix) == n:
         return [prefix]

    words = concat_word (last_pref, relative_n)

    ret_list = []

    for word in words : 
        final_word = prefix + word
        ret_list.append(final_word)

    return ret_list

"""------------------------------------------------------------------------------------------------"""

def search_prefix(trie : T.Trie ,word : str) : 

    current : T.TrieNode = trie.root

    for i in range (0, len(word)):

        flag = False

        for j in range(0, len(current.children)):
                    
            if word[i] == current.children[j].key:
                          
                current = current.children[j]
                flag = True
                break

        if not flag:
               return -1
          
    return current 
         
"""------------------------------------------------------------------------------------------------"""

def concat_word (node : T.TrieNode, n : int, aux_word : str = ""):
    
    words = []
    
    for element in node.children :
        current_word = aux_word + element.key 
        if len(current_word) == n and element.isEndOfWord :
            words.append(current_word)
        elif len(aux_word) < n : 
            words.extend(concat_word(element, n, current_word))
    
    return words

"""------------------------------------------------------------------------------------------------"""
    
# Crear trie
trie = T.Trie()

# Insertar palabras
words_to_insert = [
    # Prefijo "cat", longitud 5
    "cabin", "candy", "cable", "capon", "caper", "carve", "catch", "cater", "catty", "cavil",
    
    # Prefijo "dog", longitud 5
    "dodge", "doggy", "dolor", "dough", "dowel", "dummy", "dandy", "digit", "donut", "dingo",
    
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

T.print_trie(trie.root)

print(all_words(trie, "cat", 5))   # Devuelve 10 palabras: ['cabin', 'candy', 'cable', 'capon', 'caper', 'carve', 'catch', 'cater', 'catty', 'cavil']
print(all_words(trie, "dog", 5))   # Devuelve 10 palabras basura + reales
print(all_words(trie, "app", 5))   # Devuelve 10 palabras
print(all_words(trie, "car", 6))   # Devuelve 10 palabras
print(all_words(trie, "sun", 6))   # Devuelve 10 palabras
print(all_words(trie, "rain", 6))  # Devuelve 10 palabras
print(all_words(trie, "blu", 6))   # Devuelve 10 palabras
print(all_words(trie, "star", 6))  # Devuelve 10 palabras