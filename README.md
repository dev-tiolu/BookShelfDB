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

   ```bash
   git clone https://github.com/yourusername/booksdb.git
   cd booksdb
