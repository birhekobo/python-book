---
title: "Week 2 Project: Number Guessing Game"
---

# Week 2 Project: Number Guessing Game

:::{important}
**Learning Objectives**
- Use conditional statements (`if`/`elif`/`else`) for game logic
- Implement loops (`while`) for repeated guessing
- Generate random numbers with the `random` module
- Track and display game statistics
- Handle user input validation
:::

| **Aspect** | **Details** |
|------------|-------------|
| **Time** | 60-90 minutes |
| **Prerequisites** | Week 2 lessons on conditionals, loops, the `random` module |

---

## Theory

### The `random` Module

`random.randint(a, b)` returns a random integer N such that `a <= N <= b`.

```python
import random
secret = random.randint(1, 10)  # Random number between 1 and 10
```

### While Loops

A `while` loop repeats as long as a condition is `True`:

```python
while True:
    guess = int(input("Your guess: "))
    if guess == secret:
        break  # Exit the loop
```

### Infinite Loops and `break`

Be careful not to create infinite loops. Use `break` to exit when the correct guess is made, and ensure there's always a path to `break`.

### Score Tracking

Use a counter variable incremented on each guess:

```python
attempts = 0
while True:
    guess = int(input("Guess: "))
    attempts += 1
```

---

## Step-by-Step Instructions

### Step 1: Set Up Difficulty Levels

Display a menu for Easy (1-10), Medium (1-50), or Hard (1-100). Based on the choice, set the range and number of allowed attempts.

### Step 2: Generate the Secret Number

Use `random.randint()` with the chosen range.

### Step 3: Implement the Guessing Loop

Allow the user to guess until they run out of attempts or guess correctly. Provide "too high" / "too low" hints.

### Step 4: Track and Display Score

Count attempts and display them when the game ends.

### Step 5: Add Play Again

Ask the user if they want to play again. Loop the entire game if they say yes.

---

## Complete Code

```python
import random

print("=" * 40)
print("     Welcome to the Number Guessing Game!")
print("=" * 40)

while True:  # Main game loop
    # Difficulty selection
    print("\nSelect difficulty:")
    print("1. Easy   (1-10, 6 attempts)")
    print("2. Medium (1-50, 8 attempts)")
    print("3. Hard   (1-100, 10 attempts)")

    choice = input("Enter 1, 2, or 3: ")

    if choice == "1":
        low, high, max_attempts = 1, 10, 6
    elif choice == "2":
        low, high, max_attempts = 1, 50, 8
    elif choice == "3":
        low, high, max_attempts = 1, 100, 10
    else:
        print("Invalid choice. Defaulting to Easy.")
        low, high, max_attempts = 1, 10, 6

    secret = random.randint(low, high)
    attempts = 0
    guessed = False

    print(f"\nI'm thinking of a number between {low} and {high}.")
    print(f"You have {max_attempts} attempts. Good luck!\n")

    while attempts < max_attempts:
        try:
            guess = int(input(f"Attempt {attempts + 1}/{max_attempts}: "))
        except ValueError:
            print("Please enter a valid number.")
            continue

        attempts += 1

        if guess < low or guess > high:
            print(f"Your guess is out of range ({low}-{high}). Try again.")
        elif guess < secret:
            print("Too low! 📉")
        elif guess > secret:
            print("Too high! 📈")
        else:
            print(f"\nCongratulations! You guessed it in {attempts} attempts!")
            guessed = True
            break

    if not guessed:
        print(f"\nGame over! The number was {secret}.")

    play_again = input("\nPlay again? (yes/no): ").strip().lower()
    if play_again != "yes" and play_again != "y":
        print("Thanks for playing!")
        break
```

---

## Code Explanation

| Line(s) | Explanation |
|---------|-------------|
| `import random` | Imports the module needed to generate random numbers. |
| `while True:` | Outer loop — runs the entire game until the player chooses to quit. |
| `choice = input(...)` | Captures the difficulty choice as a string. |
| `if choice == "1":` | Sets `low`, `high`, and `max_attempts` based on difficulty. |
| `secret = random.randint(low, high)` | Generates the number to guess. |
| `while attempts < max_attempts:` | Inner loop — one round of guessing with a limit. |
| `try: ... except ValueError:` | Catches non-integer input and re-prompts without consuming an attempt. |
| `if guess < secret:` | Compares the guess to the secret and gives a hint. |
| `guessed = True` | Flag variable; tracks whether the player won. |
| `break` | Exits the inner loop when the guess is correct. |
| `if not guessed:` | After the loop, checks the flag: if still `False`, the player lost. |
| `play_again input...` | Asks if the user wants another round. |

---

## Testing

### Test Case 1: Normal Game (Easy)

```
========================================
     Welcome to the Number Guessing Game!
========================================

Select difficulty:
1. Easy   (1-10, 6 attempts)
2. Medium (1-50, 8 attempts)
3. Hard   (1-100, 10 attempts)
Enter 1, 2, or 3: 1

I'm thinking of a number between 1 and 10.
You have 6 attempts. Good luck!

Attempt 1/6: 5
Too low!
Attempt 2/6: 8
Too high!
Attempt 3/6: 7
Congratulations! You guessed it in 3 attempts!
```

### Test Case 2: Invalid Input

```
Attempt 1/6: abc
Please enter a valid number.
Attempt 1/6: 3
Too low!
```

:::{warning}
Always validate user input. If `int()` receives something that isn't a number, it raises a `ValueError` and crashes the program without a `try/except`.
:::

:::{tip}
Use `continue` inside the `except` block to skip back to the loop start without consuming an attempt.
:::

---

## Extensions

### Extension 1: High Score File

Save the best (fewest attempts) score to a JSON file:

```python
import json

high_scores = {}
try:
    with open("high_scores.json", "r") as f:
        high_scores = json.load(f)
except FileNotFoundError:
    pass

# After a win:
diff_name = ["Easy", "Medium", "Hard"][int(choice) - 1]
if diff_name not in high_scores or attempts < high_scores[diff_name]:
    high_scores[diff_name] = attempts
    with open("high_scores.json", "w") as f:
        json.dump(high_scores, f)
    print(f"New high score for {diff_name}: {attempts} attempts!")
```

### Extension 2: Add a Timer

Use the `time` module to track how long each round takes:

```python
import time

start_time = time.time()
# ... game loop ...
elapsed = time.time() - start_time
print(f"You took {elapsed:.2f} seconds.")
```

### Extension 3: Custom Range

Add a fourth menu option allowing the player to enter their own low and high values.

---

## Challenge Questions

1. How would you modify the game to give "very close" hints when the guess is within 2 of the secret number?
2. The current code doesn't prevent the same guess from being counted twice. How would you track previous guesses?
3. What happens if `max_attempts` is set to 0 or a negative number? How would you guard against this?
4. How could you implement a scoring system that awards more points for harder difficulties and fewer attempts?

---

## Solution to Challenge Questions

**Question 1 — Proximity hints:**

```python
if abs(guess - secret) <= 2:
    print("Very close!")
elif guess < secret:
    print("Too low!")
else:
    print("Too high!")
```

**Question 2 — Track previous guesses:**

```python
previous_guesses = set()
# ... in loop:
if guess in previous_guesses:
    print("You already guessed that number!")
    continue
previous_guesses.add(guess)
```

**Question 3 — Guard against invalid `max_attempts`:**

```python
if max_attempts <= 0:
    print("Invalid configuration. Defaulting to 1 attempt.")
    max_attempts = 1
```

**Question 4 — Scoring system:**

```python
difficulty_multiplier = {"1": 1, "2": 2, "3": 3}
base_score = 1000
score = max(0, base_score // attempts * difficulty_multiplier[choice])
print(f"Score: {score}")
```
