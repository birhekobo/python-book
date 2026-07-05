# All Solutions — Weeks 1–6

:::{important}
Try to solve each problem on your own before reading the solution.
:::

---

## Week 1 — Python Basics, Variables, Data Types, Strings, Input/Output

### Try It Yourself Exercises

**Exercise 1: Print a greeting**
```python
# Problem: Write a program that prints "Hello, Python!" to the console.
print("Hello, Python!")
```

**Exercise 2: Variables and arithmetic**
```python
# Problem: Create variables a = 15 and b = 4. Print their sum, difference,
# product, quotient (float), and floor division result.
a = 15
b = 4
print("Sum:", a + b)
print("Difference:", a - b)
print("Product:", a * b)
print("Quotient:", a / b)
print("Floor Division:", a // b)
```

**Exercise 3: String manipulation**
```python
# Problem: Ask the user for their name and age, then print a message
# saying "Hello [name], you are [age] years old!"
name = input("Enter your name: ")
age = input("Enter your age: ")
print(f"Hello {name}, you are {age} years old!")
```

**Exercise 4: Type conversion**
```python
# Problem: Convert the string "123" to an integer, add 77, and print the result.
num = int("123")
print(num + 77)  # 200
```

### Quiz Questions

Refer to [Week 1 Quiz](../quizzes/week1-quiz.md) for detailed explanations.

### Challenge Questions

**Challenge 1: FizzBuzz**
```python
# Problem: Print numbers 1 to 50. For multiples of 3 print "Fizz",
# for multiples of 5 print "Buzz", for multiples of both print "FizzBuzz".
for i in range(1, 51):
    if i % 3 == 0 and i % 5 == 0:
        print("FizzBuzz")
    elif i % 3 == 0:
        print("Fizz")
    elif i % 5 == 0:
        print("Buzz")
    else:
        print(i)
```

---

## Week 2 — Booleans, Conditionals, Loops

### Try It Yourself Exercises

**Exercise 1: Even or odd**
```python
# Problem: Ask the user for a number and print whether it is even or odd.
num = int(input("Enter a number: "))
if num % 2 == 0:
    print("Even")
else:
    print("Odd")
```

**Exercise 2: Countdown**
```python
# Problem: Print a countdown from 10 to 1 using a while loop.
count = 10
while count > 0:
    print(count)
    count -= 1
print("Blast off!")
```

**Exercise 3: Sum of numbers**
```python
# Problem: Use a for loop to calculate the sum of numbers from 1 to 100.
total = 0
for i in range(1, 101):
    total += i
print(total)  # 5050
```

**Exercise 4: Multiplication table**
```python
# Problem: Print the multiplication table (1 to 5) using nested loops.
for i in range(1, 6):
    for j in range(1, 6):
        print(f"{i * j:2d}", end=" ")
    print()
```

### Challenge Questions

**Challenge 1: Prime numbers**
```python
# Problem: Print all prime numbers between 1 and 100.
for num in range(2, 101):
    is_prime = True
    for i in range(2, int(num ** 0.5) + 1):
        if num % i == 0:
            is_prime = False
            break
    if is_prime:
        print(num, end=" ")
# Output: 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97
```

---

## Week 3 — Functions, Scope, Recursion, Lambda, Map/Filter

### Try It Yourself Exercises

**Exercise 1: Function with return value**
```python
# Problem: Write a function `add(a, b)` that returns the sum of two numbers.
def add(a, b):
    return a + b

print(add(3, 7))  # 10
```

**Exercise 2: Default arguments**
```python
# Problem: Write a function `greet(name, greeting="Hello")` that prints
# a greeting message.
def greet(name, greeting="Hello"):
    print(f"{greeting}, {name}!")

greet("Alice")           # Hello, Alice!
greet("Bob", "Hi")       # Hi, Bob!
```

**Exercise 3: Recursive factorial**
```python
# Problem: Write a recursive function to compute the factorial of a number.
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)

print(factorial(5))  # 120
```

**Exercise 4: Lambda with map/filter**
```python
# Problem: Use map and lambda to square all numbers in a list.
# Use filter and lambda to keep only even numbers.
numbers = [1, 2, 3, 4, 5]
squares = list(map(lambda x: x ** 2, numbers))
evens = list(filter(lambda x: x % 2 == 0, numbers))
print(squares)  # [1, 4, 9, 16, 25]
print(evens)    # [2, 4]
```

### Challenge Questions

**Challenge 1: Fibonacci sequence**
```python
# Problem: Write a recursive function to return the nth Fibonacci number.
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)

# Print first 10 Fibonacci numbers
for i in range(10):
    print(fibonacci(i), end=" ")
# Output: 0 1 1 2 3 5 8 13 21 34
```

---

## Week 4 — Lists, Tuples, Dictionaries, Sets, Comprehensions

### Try It Yourself Exercises

**Exercise 1: List operations**
```python
# Problem: Create a list of 5 numbers. Append a number, insert a number
# at position 2, remove the third element, and print the final list.
nums = [10, 20, 30, 40, 50]
nums.append(60)
nums.insert(2, 25)
nums.pop(3)  # removes index 3 (was 30 after insert)
print(nums)  # [10, 20, 25, 40, 50, 60]
```

**Exercise 2: Dictionary of squares**
```python
# Problem: Use a dictionary comprehension to create a dict mapping
# numbers 1 to 10 to their squares.
squares = {x: x ** 2 for x in range(1, 11)}
print(squares)
# {1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64, 9: 81, 10: 100}
```

**Exercise 3: Set operations**
```python
# Problem: Given two sets, find their union, intersection, and difference.
set_a = {1, 2, 3, 4, 5}
set_b = {4, 5, 6, 7, 8}
union = set_a | set_b
intersection = set_a & set_b
difference = set_a - set_b
print("Union:", union)           # {1, 2, 3, 4, 5, 6, 7, 8}
print("Intersection:", intersection)  # {4, 5}
print("Difference:", difference)      # {1, 2, 3}
```

**Exercise 4: Tuple unpacking**
```python
# Problem: Create a tuple with three elements and unpack them into variables.
point = (3, 7, 2)
x, y, z = point
print(f"x={x}, y={y}, z={z}")  # x=3, y=7, z=2
```

### Challenge Questions

**Challenge 1: Word frequency counter**
```python
# Problem: Count the frequency of each word in a given sentence using a dict.
sentence = "the quick brown fox jumps over the lazy dog the dog"
words = sentence.split()
freq = {}
for word in words:
    freq[word] = freq.get(word, 0) + 1
print(freq)
# {'the': 3, 'quick': 1, 'brown': 1, 'fox': 1, 'jumps': 1, 'over': 1, 'lazy': 1, 'dog': 2}
```

---

## Week 5 — File I/O, CSV, JSON, Exception Handling

### Try It Yourself Exercises

**Exercise 1: Write and read a text file**
```python
# Problem: Write "Hello, File!" to a file named "test.txt", then read it back.
with open("test.txt", "w") as f:
    f.write("Hello, File!")

with open("test.txt", "r") as f:
    content = f.read()
print(content)  # Hello, File!
```

**Exercise 2: CSV file handling**
```python
# Problem: Write a list of rows to a CSV file, then read it back.
import csv

data = [["Name", "Age", "City"],
        ["Alice", 30, "New York"],
        ["Bob", 25, "London"]]

with open("people.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(data)

with open("people.csv", "r") as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)
```

**Exercise 3: JSON serialization**
```python
# Problem: Convert a Python dictionary to a JSON string and write it to a file.
import json

person = {"name": "Alice", "age": 30, "city": "New York"}

# Write to file
with open("person.json", "w") as f:
    json.dump(person, f, indent=2)

# Read back
with open("person.json", "r") as f:
    data = json.load(f)
print(data)  # {'name': 'Alice', 'age': 30, 'city': 'New York'}
```

**Exercise 4: Exception handling**
```python
# Problem: Safely divide two numbers entered by the user, handling
# division by zero and invalid input.
try:
    a = float(input("Enter first number: "))
    b = float(input("Enter second number: "))
    result = a / b
    print(f"Result: {result}")
except ZeroDivisionError:
    print("Error: Cannot divide by zero!")
except ValueError:
    print("Error: Please enter valid numbers!")
```

### Challenge Questions

**Challenge 1: Log file analyzer**
```python
# Problem: Read a log file and count the number of ERROR, WARNING, and INFO lines.
log_content = """INFO: Application started
ERROR: Database connection failed
INFO: User logged in
WARNING: Disk space low
ERROR: Timeout occurred
INFO: Application shutdown"""

counts = {"INFO": 0, "WARNING": 0, "ERROR": 0}

for line in log_content.split("\n"):
    for level in counts:
        if line.startswith(level):
            counts[level] += 1
            break

print(counts)  # {'INFO': 3, 'WARNING': 1, 'ERROR': 2}
```

---

## Week 6 — Classes, Objects, Inheritance, Polymorphism, Encapsulation

### Try It Yourself Exercises

**Exercise 1: Simple class**
```python
# Problem: Define a `Dog` class with attributes `name` and `age`,
# and a method `bark()` that prints "Woof!".
class Dog:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def bark(self):
        print("Woof!")

my_dog = Dog("Buddy", 3)
my_dog.bark()            # Woof!
print(my_dog.name)       # Buddy
```

**Exercise 2: Inheritance**
```python
# Problem: Create a `Vehicle` parent class and a `Car` child class that
# inherits from it and adds a `model` attribute.
class Vehicle:
    def __init__(self, brand):
        self.brand = brand

    def honk(self):
        print("Beep!")

class Car(Vehicle):
    def __init__(self, brand, model):
        super().__init__(brand)
        self.model = model

    def honk(self):
        print(f"{self.brand} {self.model} says Beep!")

my_car = Car("Toyota", "Corolla")
my_car.honk()  # Toyota Corolla says Beep!
```

**Exercise 3: Encapsulation**
```python
# Problem: Create a `BankAccount` class with private balance and methods
# to deposit, withdraw, and check balance.
class BankAccount:
    def __init__(self, owner, balance=0):
        self.owner = owner
        self.__balance = balance  # private attribute

    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            print(f"Deposited {amount}. New balance: {self.__balance}")

    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            print(f"Withdrew {amount}. New balance: {self.__balance}")
        else:
            print("Insufficient funds or invalid amount!")

    def get_balance(self):
        return self.__balance

account = BankAccount("Alice", 1000)
account.deposit(500)      # Deposited 500. New balance: 1500
account.withdraw(200)     # Withdrew 200. New balance: 1300
print(account.get_balance())  # 1300
```

**Exercise 4: Polymorphism**
```python
# Problem: Create different animal classes that all implement a `speak()`
# method in their own way.
class Cat:
    def speak(self):
        return "Meow!"

class Dog:
    def speak(self):
        return "Woof!"

class Duck:
    def speak(self):
        return "Quack!"

def make_sound(animal):
    print(animal.speak())

make_sound(Cat())   # Meow!
make_sound(Dog())   # Woof!
make_sound(Duck())  # Quack!
```

### Challenge Questions

**Challenge 1: Library management system**
```python
# Problem: Create a simple library system with Book and Library classes.
# Books can be checked out and returned.
class Book:
    def __init__(self, title, author, isbn):
        self.title = title
        self.author = author
        self.isbn = isbn
        self.checked_out = False

    def __str__(self):
        status = "Available" if not self.checked_out else "Checked Out"
        return f"'{self.title}' by {self.author} [{status}]"

class Library:
    def __init__(self):
        self.books = []

    def add_book(self, book):
        self.books.append(book)

    def search_by_title(self, title):
        return [book for book in self.books if title.lower() in book.title.lower()]

    def check_out(self, isbn):
        for book in self.books:
            if book.isbn == isbn and not book.checked_out:
                book.checked_out = True
                return f"Checked out: {book.title}"
        return "Book not available"

    def return_book(self, isbn):
        for book in self.books:
            if book.isbn == isbn and book.checked_out:
                book.checked_out = False
                return f"Returned: {book.title}"
        return "Book not found or not checked out"

# Usage
lib = Library()
lib.add_book(Book("1984", "George Orwell", "978-0451524935"))
lib.add_book(Book("To Kill a Mockingbird", "Harper Lee", "978-0446310789"))

print(lib.check_out("978-0451524935"))  # Checked out: 1984
print(lib.return_book("978-0451524935"))  # Returned: 1984

for book in lib.books:
    print(book)
# '1984' by George Orwell [Available]
# 'To Kill a Mockingbird' by Harper Lee [Available]
```
