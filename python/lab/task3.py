Emploees =[['mostafa','1200','electronics','20011963'],
           ['mohamed','1500','electronics','20011978'],
           ['ahmed','2500','computer','20000078']]
print("List of emploees:")
print(Emploees)
print("-----------------------")
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
       given=[name,salary,department,idd]
       Emploees.append(given)
       print(Emploees)
       break
   elif x==2:
       count=-1
       print("enter the name :")
       sos=input()
       for i in Emploees:
           count=count+1
           if i[0]==sos:
               print(Emploees[count])
               break
   elif x==3:
       print("enter the name :")
       sos=input()
       for i in Emploees:
           if i[0]==sos:
               Emploees.remove(i)
               print(Emploees)
               break
               
   elif x==4:
       for i in range(len(Emploees)):
          print( Emploees[i] )
          
          break
       
           
       


