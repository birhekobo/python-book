# Week 6 Quiz — Classes, Objects, Inheritance, Polymorphism, Encapsulation

:::{important}
Answer all questions before checking solutions.
:::

## Questions

1. **What keyword is used to define a class in Python?**
   - A) `struct`
   - B) `class`
   - C) `object`
   - D) `def`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   The `class` keyword defines a class. `def` defines a function. `struct` is not a Python keyword.
   ```

2. **What is `__init__` in a Python class?**
   - A) A destructor
   - B) A constructor method called when an object is created
   - C) A method that returns a string representation
   - D) A private method

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `__init__` is the initializer (constructor) called automatically when a new instance is created.
   ```

3. **What does `self` refer to in a class method?**
   - A) The class itself
   - B) The current instance of the class
   - C) The parent class
   - D) A global variable

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `self` is a reference to the current instance of the class. It must be the first parameter of instance methods.
   ```

4. **What is inheritance in OOP?**
   - A) Creating a new class from an existing class
   - B) Hiding data from outside access
   - C) Defining multiple methods with the same name
   - D) Creating multiple objects from a class

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   Inheritance allows a class (child) to derive properties and methods from another class (parent).
   ```

5. **What does `super()` do?**
   - A) Calls the parent class's method
   - B) Creates a new instance of the parent class
   - C) Returns the class name as a string
   - D) Deletes the current object

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   `super()` returns a temporary object of the superclass, allowing you to call its methods.
   ```

6. **What is polymorphism?**
   - A) The ability of a class to have multiple parents
   - B) The ability of different classes to respond to the same method in different ways
   - C) The ability to hide data
   - D) The ability to create multiple constructors

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   Polymorphism means the same interface (method name) can be used with different types, each implementing it differently.
   ```

7. **How do you indicate a method is "private" in Python?**
   - A) Using the `private` keyword
   - B) Prefixing the name with double underscore `__`
   - C) Prefixing the name with a single underscore `_`
   - D) Both B and C are conventions

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: D**
   A single underscore `_` is a convention for protected members. Double underscore `__` triggers name mangling, making it harder to access from outside.
   ```

8. **What does `isinstance(obj, MyClass)` do?**
   - A) Creates an instance of MyClass
   - B) Checks if `obj` is an instance of `MyClass` or its subclasses
   - C) Converts `obj` to `MyClass`
   - D) Deletes `obj` from `MyClass`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `isinstance()` returns `True` if `obj` is an instance of `MyClass` or any class that inherits from it.
   ```

9. **What is a class variable?**
   - A) A variable unique to each instance
   - B) A variable shared by all instances of the class
   - C) A variable defined inside a method
   - D) A variable that cannot be changed

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   A class variable is defined in the class body and shared across all instances. Instance variables are unique to each object.
   ```

10. **What is method overriding?**
    - A) Defining multiple methods with different names
    - B) Redefining a parent class method in a child class
    - C) Calling a method with too many arguments
    - D) Hiding a method from outside access

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: B**
    Method overriding occurs when a child class provides a specific implementation of a method already defined in its parent class.
    ```
