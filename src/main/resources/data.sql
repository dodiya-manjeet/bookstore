-- Insert sample authors
INSERT INTO authors (name, email, country) VALUES 
('J.K. Rowling', 'jkrowling@email.com', 'United Kingdom'),
('George R.R. Martin', 'grrm@email.com', 'United States'),
('J.R.R. Tolkien', 'tolkien@email.com', 'United Kingdom'),
('Stephen King', 'sking@email.com', 'United States'),
('Agatha Christie', 'achristie@email.com', 'United Kingdom'),
('Dan Brown', 'dbrown@email.com', 'United States'),
('Haruki Murakami', 'hmurakami@email.com', 'Japan'),
('Jane Austen', 'jausten@email.com', 'United Kingdom'),
('Ernest Hemingway', 'ehemingway@email.com', 'United States'),
('Leo Tolstoy', 'ltolstoy@email.com', 'Russia');

-- Insert sample books
INSERT INTO books (title, isbn, genre, price, author_id) VALUES 
('Harry Potter and the Philosopher''s Stone', '9780747532743', 'Fantasy', 19.99, 1),
('Harry Potter and the Chamber of Secrets', '9780747538493', 'Fantasy', 21.99, 1),
('A Game of Thrones', '9780553103540', 'Fantasy', 24.99, 2),
('A Clash of Kings', '9780553108033', 'Fantasy', 25.99, 2),
('The Hobbit', '9780547928227', 'Fantasy', 18.99, 3),
('The Lord of the Rings', '9780544003415', 'Fantasy', 29.99, 3),
('The Shining', '9780307743657', 'Horror', 15.99, 4),
('Murder on the Orient Express', '9780062693662', 'Mystery', 14.99, 5),
('The Da Vinci Code', '9780307474278', 'Thriller', 16.99, 6),
('Norwegian Wood', '9780375704024', 'Fiction', 17.99, 7);