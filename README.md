# BookShelfDB
## Automating Database Creation and Management using Bash and PostgreSQL

Hello there! Welcome to **BookShelfDB**. 

This project is designed to help you create a PostgreSQL database to store information about books, like the title, subtitle, author, and publisher. 

## What’s in the Project?

Here's a quick rundown of what you'll find:

- **Bash Script (`create_booksdb.sh`):**  
  This is the heart of the project. It creates a new PostgreSQL database called `booksdb`, sets up a table to store book data, creates two user roles (one with admin privileges and another with view-only rights), and adds a function and a view to enhance your database experience.

- **PostgreSQL Components:**  
  - **Table:** `books` with columns for `id`, `title`, `subtitle`, `author`, and `publisher`.
  - **User Roles:**  
    - `admin_user` (with full privileges)  
    - `view_user` (with read-only privileges)
  - **Function:** `count_books_by_publisher(pub VARCHAR)` — This function counts how many books are associated with a given publisher.
  - **View:** `books_view` — This view displays book details along with a count of books from the same publisher.

## Getting Started

### Prerequisites

Before you begin, make sure you have the following installed on your machine:

- **PostgreSQL:** You need to have PostgreSQL installed and accessible (the script assumes you can connect as the `postgres` user).
- **Bash:** The script is written for Bash, so you'll need a Unix-like environment (Linux, macOS, or WSL on Windows).

### Installation & Setup

1. **Clone the Repository:**

   ```
   git clone https://github.com/yourusername/booksdb.git
   cd booksdb
   ```

2. **Make the Script Executable:**
   Ensure the bash script has the executable permission:
   ```
   chmod +x create_booksdb.sh
   ```

3. **Run the Script:**
   Execute the script to create the database, tables, roles, function, and view:
   ```
   ./create_booksdb.sh
   ```
   The script will connect to **PostgreSQL**, create the `booksdb` database, set up the necessary components, and output a message once everything is complete.

## How It Works
### Database Creation:
The script first drops any existing database named `booksdb` (to start fresh) and then creates a new one.

### Table & Schema Setup:
Inside the database, it creates a `books` table with columns to store information about each book.

### User Roles:
Two roles are created:

+ **admin_user:** This role gets full privileges to manage the database.
+ **view_user:** This role is granted read-only access, perfect for users who only need to view the data.
  
### Function & View:
+ The `count_books_by_publisher` function returns the count of books for a specified publisher.
+ The `books_view` view uses this function to display each book along with the count of books from the same publisher, making your queries more insightful.

