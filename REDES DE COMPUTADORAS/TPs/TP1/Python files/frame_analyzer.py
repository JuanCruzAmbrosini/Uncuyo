"""---------------------------------------------------------------------------------------------------------------------------------"""
"""Este bloque se encarga de encontrar las tramas y guardarlas en una lista. Para esto se utiliza la funcion find para encontrar los 
valores 7E iterativamente hasta llegar al final de la cadena (teniendo en cuenta las secuencias de escape)"""

def frame_listing(hex : str): 
    
    index = 0
    frame_list = []
    
    while index != -1 :
        
        start = hex.find("7E", index)
        
        if start == -1 :
            break
            
        end = hex.find("7E", start + 1)
        
        while end != -1 and hex [end - 2 : end] == "7D" : 
            end = hex.find("7E", end + 1) 
            
        if end == -1:
            frame = hex[start:]
            index = -1
        else:
            frame = hex[start:end]
            index = end
            
        frame_list.append(frame)
    
    frame_list.reverse
    
    return frame_list

"""---------------------------------------------------------------------------------------------------------------------------------"""
"""En este bloque se verifica la longitud de una trama en especifico"""

def is_length_ok(frame : str):
    
    trimmed_frame = frame[6 : len(frame) - 2] 
   
    frame_size = len(trimmed_frame)
    
    if frame.find("7D7E") != -1 :
        frame_size = frame_size - 2
    
    lenght = frame[2 : 6]
    lenght = int(lenght, 16)
    
    if frame_size/2 == lenght:
        return True
    else: 
        return False

""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - """
"""En este bloque se itera el bloque anterior sobre la lista de trazas formada previamente"""

def count_frames_length_ok(frame_list):

    counter = 0

    for frame in frame_list:
        if is_length_ok(frame):
            counter += 1
    return counter

"""---------------------------------------------------------------------------------------------------------------------------------"""
"""En este bloque se verifica el checksum de una trama en especifico"""


def checksum_check(frame : str):

    checksum = frame[len(frame) - 2 : len(frame)]
    trimmed_frame = frame[6 : len(frame) - 2]

    index = trimmed_frame.find("7D7E")

    if index != -1 :
        trimmed_frame =trimmed_frame.replace("7D7E", "7E")

    actual_checksum = 0xFF - (sum(bytes.fromhex(trimmed_frame)) & 0xFF)

    if int(checksum, 16) == actual_checksum and is_length_ok:
        return True
    else:
        return False

""" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - """
"""En este bloque se itera el bloque anterior sobre la lista de trazas formada previamente"""

def count_frames_checksum_wrong (frame_list):

    counter = 0

    for frame in frame_list : 
        if not checksum_check(frame) :
            counter += 1
    return counter

"""---------------------------------------------------------------------------------------------------------------------------------"""
"""En este bloque se cuentan las trazas con una secuencia de escape presente"""

def frames_with_scape_secuence(frame_list):

    counter = 0

    for frame in frame_list:
        if frame.find("7D7E") != -1 : 
            counter += 1
    
    return counter

"""---------------------------------------------------------------------------------------------------------------------------------"""
"""En este bloque se lee el archivo y se lo pasa a string"""

with open("Tramas_802-15-4.log", "r") as frame_log:
    lines = frame_log.read().strip().replace("\n", "").replace("\r", "")

frame_list = frame_listing(lines)
    
"""---------------------------------------------------------------------------------------------------------------------------------"""
"""Bloque de muestra de resultados"""

print("La cantidad de tramas encontradas es de: " , len(frame_list))
print("La cantidad de tramas con la longitud correcta es de: " , count_frames_length_ok(frame_list))
print("La cantidad de tramas con la longitud incorrecta es de: " , len(frame_list) - count_frames_length_ok(frame_list))
print("La cantidad de tramas con la longitud correcta y el checksum correcto es de: " , count_frames_length_ok(frame_list) - count_frames_checksum_wrong(frame_list))
print("La cantidad de tramas con la longitud correcta y el checksum incorrecto es de: " , count_frames_checksum_wrong(frame_list))
print("La cantidad de tramas con secuencia de escape es de: " , frames_with_scape_secuence(frame_list))


