# lists , dictionary , tuples , sets
# list : ordered , mutable , allows duplicate elements
# dictionary : unordered , mutable , no duplicate elements
# tuples : ordered , immutable , allows duplicate elements
# sets : unordered , mutable , no duplicate elements
# list
# syntax : list_name = [element1, element2, element3]
my_list = ["apple", "banana","mango", "cherry"]
print("List:", my_list)
print("Best fruit:", my_list[2])  
my_list.append("orange")
print("After append:", my_list)
my_list.remove("banana")
print("After remove:", my_list)
my_list[1] = "kiwi"
print("After update:", my_list)

print(my_list[1:2])
