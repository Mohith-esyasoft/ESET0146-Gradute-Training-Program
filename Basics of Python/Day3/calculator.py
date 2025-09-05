def add(a,b):
    return a+b

def subtract(a,b):
    return a-b

def multiply(a,b):
    return a*b

def divide(a,b):
    return a/b

operation = input("Enter operation to be performed 1. Add 2. Subtract 3. Multiply 4. Divide: ")
num1 = int(input("Enter first number: "))
num2 = int(input("Enter second number: "))

if operation == '1':
    print("The sum is:", add(num1,num2))
elif operation == '2': 
    print("The difference is:", subtract(num1,num2))            
elif operation == '3':
    print("The product is:", multiply(num1,num2))
elif operation == '4':
    print("The quotient is:", divide(num1,num2))
    1

