"""---------------------------------------------------------------------------------------------------------------------------------"""

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

def is_length_ok(frame : str):
    
    trimmed_frame = frame[7 : len(frame) - 1] 
   
    frame_size = len(trimmed_frame)
    
    if frame.find("7D7E") != -1 :
        frame_size = frame_size - 2
    
    lenght = frame[2 : 6]
    lenght = int(lenght, 16)
    
    if frame_size/2 == lenght:
        return True
    else: 
        print(frame)
        print(len(frame))
        return False

"""---------------------------------------------------------------------------------------------------------------------------------"""

def count_length_ok(frame_list):
    counter = 0
    for frame in frame_list:
        if is_length_ok(frame):
            counter += 1
    return counter

"""---------------------------------------------------------------------------------------------------------------------------------"""

with open("Tramas_802-15-4.log", "r") as frame_log:
    lines = frame_log.read()

frame_list = frame_listing(lines)
    
print(len(frame_list))
print(len(frame_list) - count_length_ok(frame_list))


