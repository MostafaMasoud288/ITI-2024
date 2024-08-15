mydict={
        "emploee1":
        {
       "name":"mostafa",
       "salary":5200,
       "department":"electronics",
       "id":20011963
        },
        "emploee2":
        {
       "name":"mohamed",
       "salary":1200,
       "department":"civil",
       "id":1880000
        },
        "emploee3":
        {
       "name":"mazen",
       "salary":9500,
       "department":"power",
       "id":1201010
        }
       }
print(mydict)
while 1:
    print('choose the process')
    print('1-add emploee')
    print('2-search for emploee')
    print('3-remove emploee')
    print('4-show all emploee')
    x=int(input())
    if x==1:
        print("enter the name")
        name=input()
        print("enter the salary")
        salary=input()
        print("enter the department")
        department=input()
        print("enter the id")
        idd=input()
        print("enter the key")
        key=input()
        mydict.update({key : {
        "name":name,
        "salary":salary,
        "department":department,
        "id":idd
         }})
        print(mydict)
    elif x==2:
        print("enter the name :")
        sos=input()
        for i in mydict:
            if mydict[i]["name"]==sos:
                print(mydict[i])
                break
    elif x==3:
        print("enter the name :")
        sos=input()
        for i in mydict:
            if mydict[i]["name"]==sos:
                mydict.pop(i)
                print(mydict)
                break
    elif x==4:
           print( mydict)
           
           break
        