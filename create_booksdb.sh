#!/bin/bash
# This script creates the booksdb database, its table, users, a function, and a view.

# Define variables for database and roles
DB_NAME="booksdb"
ADMIN_USER="admin_user"
VIEW_USER="view_user"
ADMIN_PASS="admin_pass"
VIEW_PASS="view_pass"

# Drop the database if it already exists (optional)
psql -U postgres -c "DROP DATABASE IF EXISTS ${DB_NAME};"

# Create the new database
psql -U postgres -c "CREATE DATABASE ${DB_NAME};"

# Now connect to the new database and execute the SQL commands
psql -U postgres -d ${DB_NAME} <<'EOF'
-- Create the "books" table with the desired columns
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    subtitle VARCHAR(255),
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255)
);

-- Create the roles (users) if they do not already exist.
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'admin_user') THEN
        CREATE ROLE admin_user LOGIN PASSWORD 'admin_pass';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'view_user') THEN
        CREATE ROLE view_user LOGIN PASSWORD 'view_pass';
    END IF;
END
$$;

-- Grant privileges:
-- admin_user gets full privileges on the public schema tables,
-- while view_user gets read-only (SELECT) privileges.
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO view_user;

-- Create a function that counts the number of books for a given publisher.
CREATE OR REPLACE FUNCTION count_books_by_publisher(pub VARCHAR)
RETURNS INTEGER AS $$
DECLARE
    book_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO book_count
    FROM books
    WHERE publisher = pub;
    RETURN book_count;
END;
$$ LANGUAGE plpgsql STABLE;

-- Create a view that displays all book details along with the number of books
-- for the same publisher (using the function above).
CREATE OR REPLACE VIEW books_view AS
SELECT
    id,
    title,
    subtitle,
    author,
    publisher,
    count_books_by_publisher(publisher) AS publisher_book_count
FROM books;
EOF

echo "Database setup complete: ${DB_NAME}"
