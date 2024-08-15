password=1234
money =5000.0
print("welcome to our bank ")
print("write your 4-digit password please :")
x=int(input())
while 1:
    if x!=password:
     print("enter correct password please :")
     x=int(input())
    else:
        break
    

print("1- withdraw ")
print("2- Balance Inquiry ")
print("3- Fast cash ")
print("4- quit ")
print("choose process : ")
process=int(input())
if process==1:
   while 1:
    print("enter withdraw amount (multiple of 100) :")
    withdraw_amount =float(input())
    if withdraw_amount%100!=0:
        print("invalid ")
    elif withdraw_amount>money:
        print("invalid --more than balance")
    else:
        remainder=money-withdraw_amount
        print("TRRRRRRRRRRRRRRRRRR")
        print("Successfully")
        print("Your remainder is :",remainder)
        break
elif process==2:
    print("Your balance is :",money)
elif process==3:
    print("1- 500$ ")
    print("2- 1000$ ")
    print("3- 5000$ ")
    print("4- 10000$ ")
    print("5- 50000$ ")
    while 1:
     print("Enter amount :")
     z=int(input())
     if z==1:
         cash=500
         new_cash=money-500
         print("TRRRRRRRRRRRRRRRRRR")
         print("Successfully")
         print("Your remainder is :",new_cash)
         break
     elif z==2:
         cash=1000
         new_cash=money-1000
         print("TRRRRRRRRRRRRRRRRRR")
         print("Successfully")
         print("Your remainder is :",new_cash)
         break
     elif z==3:
         cash=5000
         new_cash=money-5000
         print("TRRRRRRRRRRRRRRRRRR")
         print("Successfully")
         print("Your remainder is :",new_cash)
         break
     else :
         print("Invalid or insufficient balance")
else:
    print("Thank you for using our service")
         
         
     
    
         
        
    
     
    


