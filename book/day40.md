---
title: "Day 40: APIs and Automation"
---

# Day 40: APIs and Automation

## Learning Objectives
- Understand what an API is and how it works
- Use the equests library to make GET and POST requests
- Parse JSON responses from APIs
- Build a simple weather app using OpenWeatherMap API
- Automate file operations with os and shutil
- Write scripts for repetitive task automation

## Estimated Time
**2.5 hours**

## Prerequisites
- Python functions and modules
- JSON data format
- Dictionary manipulation
- File I/O basics

---

## Theory

### What is an API?

An **API** (Application Programming Interface) allows two applications to communicate. A **Web API** exposes endpoints (URLs) that accept requests and return data, typically in JSON format.

`	ext
Your App  --HTTP Request-->  API Server
Your App  <--JSON Response--  API Server
`

### HTTP Methods

| Method | Purpose | Idempotent |
|--------|---------|-----------|
| **GET** | Retrieve data | Yes |
| **POST** | Create a new resource | No |
| **PUT** | Update/replace a resource | Yes |
| **PATCH** | Partial update | No |
| **DELETE** | Remove a resource | Yes |

### The equests Library

`python
import requests

response = requests.get('https://api.example.com/data')
response = requests.post('https://api.example.com/data', json={'key': 'value'})
`

| Attribute/Method | Description |
|-----------------|-------------|
| esponse.status_code | HTTP status (200 = OK, 404 = Not Found) |
| esponse.json() | Parse JSON response to dict |
| esponse.text | Raw text response |
| esponse.headers | Response headers |
| esponse.raise_for_status() | Raise exception for 4xx/5xx |

### File Automation with os and shutil

`python
import os
import shutil

os.getcwd()              # Current directory
os.listdir('.')          # List files
os.mkdir('new_folder')   # Create directory
os.rename('a.txt', 'b.txt')  # Rename
os.remove('file.txt')    # Delete file

shutil.copy(src, dst)    # Copy file
shutil.move(src, dst)    # Move file
shutil.rmtree(path)      # Delete directory tree
os.path.exists(path)     # Check if path exists
`

---

## Code Examples

### Example 1: Basic GET Request

`python
import requests

response = requests.get('https://jsonplaceholder.typicode.com/posts/1')

print(f"Status: {response.status_code}")
print(f"Content-Type: {response.headers['Content-Type']}")

if response.status_code == 200:
    data = response.json()
    print(f"Title: {data['title']}")
    print(f"Body: {data['body'][:100]}...")
else:
    print(f"Error: {response.status_code}")
`

**Output:**
`
Status: 200
Content-Type: application/json; charset=utf-8
Title: sunt aut facere repellat provident occaecati excepturi optio reprehenderit
Body: quia et suscipit
suscipit recusandae consequuntur expedita et cum
reprehenderit molestiae ut ut quas totam...
`

### Example 2: Working with Query Parameters

`python
import requests

params = {
    'userId': 1,
    '_limit': 3
}
response = requests.get('https://jsonplaceholder.typicode.com/posts', params=params)

if response.ok:
    posts = response.json()
    for post in posts:
        print(f"[{post['id']}] {post['title']}")
else:
    print(f"Request failed: {response.status_code}")
`

**Output:**
`
[1] sunt aut facere repellat provident occaecati excepturi optio reprehenderit
[2] qui est esse
[3] ea molestias quasi exercitationem repellat qui ipsa sit aut
`

### Example 3: POST Request

`python
import requests

new_post = {
    'title': 'My New Post',
    'body': 'This is the content of my post.',
    'userId': 1
}

response = requests.post(
    'https://jsonplaceholder.typicode.com/posts',
    json=new_post
)

if response.status_code == 201:
    created = response.json()
    print(f"Created post with ID: {created['id']}")
    print(f"Title: {created['title']}")
else:
    print(f"Failed: {response.status_code}")
`

**Output:**
`
Created post with ID: 101
Title: My New Post
`

### Example 4: Weather App

`python
import requests
import os
from datetime import datetime


class WeatherApp:
    BASE_URL = "https://api.openweathermap.org/data/2.5/weather"

    def __init__(self, api_key):
        self.api_key = api_key

    def get_weather(self, city, units="metric"):
        params = {
            'q': city,
            'appid': self.api_key,
            'units': units
        }
        try:
            response = requests.get(self.BASE_URL, params=params, timeout=10)
            response.raise_for_status()
            return response.json()
        except requests.exceptions.RequestException as e:
            print(f"Error fetching weather: {e}")
            return None

    def display_weather(self, data):
        if not data:
            return
        city = data['name']
        country = data['sys']['country']
        temp = data['main']['temp']
        feels_like = data['main']['feels_like']
        humidity = data['main']['humidity']
        pressure = data['main']['pressure']
        weather_desc = data['weather'][0]['description'].title()
        wind_speed = data['wind']['speed']
        sunrise = datetime.fromtimestamp(data['sys']['sunrise'])
        sunset = datetime.fromtimestamp(data['sys']['sunset'])

        print(f"\n{'='*45}")
        print(f"  Weather for {city}, {country}")
        print(f"{'='*45}")
        print(f"  Condition:   {weather_desc}")
        print(f"  Temperature: {temp:.1f} C (feels like {feels_like:.1f} C)")
        print(f"  Humidity:    {humidity}%")
        print(f"  Pressure:    {pressure} hPa")
        print(f"  Wind:        {wind_speed} m/s")
        print(f"  Sunrise:     {sunrise.strftime('%H:%M')}")
        print(f"  Sunset:      {sunset.strftime('%H:%M')}")
        print(f"{'='*45}\n")


def main():
    api_key = os.environ.get('OWM_API_KEY', 'YOUR_API_KEY_HERE')
    if api_key == 'YOUR_API_KEY_HERE':
        print("No API key found. Set OWM_API_KEY environment variable.")
        print("Get a free key at: https://openweathermap.org/api")
        return

    app = WeatherApp(api_key)
    print("Weather App")
    print("Type 'quit' to exit.\n")

    while True:
        city = input("Enter city name: ").strip()
        if city.lower() in ('quit', 'exit', 'q'):
            break
        if not city:
            continue
        data = app.get_weather(city)
        app.display_weather(data)


if __name__ == "__main__":
    main()
`

**Sample Output:**
`
Weather App
Type 'quit' to exit.

Enter city name: London

=============================================
  Weather for London, GB
=============================================
  Condition:   Overcast Clouds
  Temperature: 15.2 C (feels like 14.8 C)
  Humidity:    72%
  Pressure:    1021 hPa
  Wind:        3.6 m/s
  Sunrise:     06:42
  Sunset:      19:38
=============================================
`

### Example 5: File Automation

`python
import os
import shutil
from datetime import datetime


class FileOrganizer:
    FILE_CATEGORIES = {
        'Images': ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.svg'],
        'Documents': ['.pdf', '.doc', '.docx', '.txt', '.md', '.csv', '.xlsx'],
        'Code': ['.py', '.js', '.html', '.css', '.json', '.xml', '.yaml'],
        'Archives': ['.zip', '.tar', '.gz', '.rar', '.7z'],
        'Videos': ['.mp4', '.avi', '.mkv', '.mov', '.wmv'],
        'Audio': ['.mp3', '.wav', '.flac', '.aac', '.ogg'],
    }

    def __init__(self, base_dir):
        self.base_dir = base_dir

    def categorize_file(self, filename):
        ext = os.path.splitext(filename)[1].lower()
        for category, extensions in self.FILE_CATEGORIES.items():
            if ext in extensions:
                return category
        return 'Other'

    def organize_directory(self, dry_run=True):
        if not os.path.exists(self.base_dir):
            print(f"Directory '{self.base_dir}' does not exist.")
            return

        organized = 0
        for item in os.listdir(self.base_dir):
            item_path = os.path.join(self.base_dir, item)
            if os.path.isdir(item_path):
                continue

            category = self.categorize_file(item)
            category_dir = os.path.join(self.base_dir, category)

            if dry_run:
                print(f"[DRY RUN] Would move: '{item}' -> {category}/")
            else:
                os.makedirs(category_dir, exist_ok=True)
                dest = os.path.join(category_dir, item)
                if os.path.exists(dest):
                    name, ext = os.path.splitext(item)
                    dest = os.path.join(category_dir, f"{name}_{datetime.now():%Y%m%d_%H%M%S}{ext}")
                shutil.move(item_path, dest)
                organized += 1

        if not dry_run:
            print(f"Moved {organized} files.")
        else:
            print(f"Would organize {organized} files. Run with dry_run=False to execute.")


organizer = FileOrganizer(r'C:\Users\You\Downloads')
organizer.organize_directory(dry_run=True)
`

**Output:**
`
[DRY RUN] Would move: 'photo.jpg' -> Images/
[DRY RUN] Would move: 'report.pdf' -> Documents/
[DRY RUN] Would move: 'script.py' -> Code/
[DRY RUN] Would move: 'archive.zip' -> Archives/
Would organize 4 files. Run with dry_run=False to execute.
`

### Example 6: Automating Backup

`python
import os
import shutil
from datetime import datetime
import json


class BackupAutomation:
    def __init__(self, source_dir, backup_root):
        self.source_dir = source_dir
        self.backup_root = backup_root
        self.log_file = os.path.join(backup_root, 'backup_log.json')

    def create_backup(self):
        if not os.path.exists(self.source_dir):
            print(f"Source '{self.source_dir}' not found.")
            return False

        os.makedirs(self.backup_root, exist_ok=True)
        timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
        backup_name = f"backup_{os.path.basename(self.source_dir)}_{timestamp}"
        backup_path = os.path.join(self.backup_root, backup_name)

        try:
            shutil.copytree(self.source_dir, backup_path)
            self._log_backup(backup_name, backup_path)
            print(f"Backup created: {backup_path}")
            return True
        except Exception as e:
            print(f"Backup failed: {e}")
            return False

    def _log_backup(self, name, path):
        log_entry = {
            'name': name,
            'path': path,
            'timestamp': datetime.now().isoformat()
        }
        logs = []
        if os.path.exists(self.log_file):
            with open(self.log_file) as f:
                logs = json.load(f)
        logs.append(log_entry)
        with open(self.log_file, 'w') as f:
            json.dump(logs, f, indent=2)

    def list_backups(self):
        if not os.path.exists(self.log_file):
            print("No backups found.")
            return
        with open(self.log_file) as f:
            logs = json.load(f)
        for log in logs:
            print(f"  [{log['timestamp']}] {log['name']} -> {log['path']}")


backup = BackupAutomation(r'C:\MyProject', r'C:\Backups')
backup.create_backup()
backup.list_backups()
`

**Output:**
`
Backup created: C:\Backups\backup_MyProject_20240701_143022
  [2024-07-01T14:30:22] backup_MyProject_20240701_143022 -> C:\Backups\backup_MyProject_20240701_143022
`

---

## Mermaid Diagram

`mermaid
sequenceDiagram
    participant Client as Your App
    participant API as API Server
    participant DB as Database

    Client->>API: GET /api/weather?city=London
    API->>DB: Query weather data
    DB-->>API: Return data
    API-->>Client: 200 OK + JSON
    Note over Client: Parse JSON response
    
    Client->>API: POST /api/users (JSON body)
    API->>DB: Create user record
    DB-->>API: User created
    API-->>Client: 201 Created + user ID
`

---

## Try It Yourself

1. Use the requests library to fetch data from the JSONPlaceholder API (/posts). Print the titles of all posts.
2. Modify the weather app to show a 5-day forecast instead of current weather.
3. Create a script that organizes your Downloads folder (use dry_run=True first!).
4. Build a backup script that compresses the backup into a ZIP file instead of copying.
5. Write an automation script that renames all .txt files in a folder to include the current date.

---

## Common Mistakes

| Mistake | Why It's Wrong | Correct |
|---------|---------------|---------|
| Hardcoding API keys in code | Security risk | Use environment variables |
| Ignoring esponse.status_code | May process error data | Check status or call aise_for_status() |
| Not setting request timeouts | Script hangs forever | Always set 	imeout=N |
| Using os.system() for file ops | Security and portability | Use shutil and os module functions |
| Deleting files without confirmation | Data loss | Use dry_run=True first |

---

## Summary

- **APIs** let applications communicate over HTTP
- The **requests** library simplifies GET/POST/PUT/DELETE calls
- Parse **JSON** responses with esponse.json()
- The **weather app** demonstrates real-world API integration
- **File automation** with os and shutil handles filesystem tasks
- Always validate status codes and handle exceptions
- Use **dry runs** before destructive file operations

## Key Takeaways

1. APIs expose endpoints that return data (usually JSON)
2. equests.get() and equests.post() cover most needs
3. Always handle network errors with try/except
4. Use environment variables for API keys
5. shutil and os are powerful for file automation
6. Test file operations with dry_run=True first

---

## Quiz

**Q1:** What HTTP method is typically used to retrieve data from an API?
1. POST
2. PUT
3. GET
4. DELETE

<details>
<summary>Solution</summary>
**Answer: 3**

GET is the standard HTTP method for retrieving data. POST creates resources, PUT updates, DELETE removes.
</details>

**Q2:** What should you always set when making HTTP requests to avoid hanging?
1. headers
2. 	imeout
3. cookies
4. erify

<details>
<summary>Solution</summary>
**Answer: 2**

Setting 	imeout=N prevents the request from hanging indefinitely if the server is unresponsive.
</details>

**Q3:** Which function would you use to recursively delete a directory and all its contents?
1. os.remove()
2. os.rmdir()
3. shutil.rmtree()
4. os.unlink()

<details>
<summary>Solution</summary>
**Answer: 3**

shutil.rmtree() recursively deletes an entire directory tree. os.remove() deletes single files, os.rmdir() deletes empty directories only.
</details>
