word="mostafa"
word_len=len(word)
expected=['-']
list_str=''
def converttostr(listing):
    result=''
    for k in listing:
        result=result+k
    return result
x=0
full=0
read=0
finded=0
for i in range(word_len-1):
    expected.append('-')
print(expected)
trials=6
while 1:

    if(list_str==word):
        print("Bingoooooooooooo")
        break
    check_x=input("enter the character\n")
    check=check_x.lower()
    
    if(trials==0):
        print("you finished your trails")
        break
    elif(not check.isalpha()):
        print("its not alpha")
        continue
    else:
        for j in expected:
            if check ==j:
                finded=1
                
        if(finded==1):
                print("you initalize before...")
                finded=0
                continue
        else:
                for i in word:              
                    if i== check:                
                        expected[x]=check
                        print("true..\n")
                        
                        read=1  
                    x=x+1
                x=0
                if read==0:
                     trials=trials-1
                     print(f"its not true your count ={trials}")
                read=0
    list_str=converttostr(expected)   
    print(list_str)