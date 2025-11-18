package com.example.bookstore.service;

import com.example.bookstore.model.Author;
import com.example.bookstore.model.Book;
import com.example.bookstore.repository.BookRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class BookServiceTest {
    
    @Mock
    private BookRepository bookRepository;
    
    @InjectMocks
    private BookService bookService;
    
    @Test
    public void testGetAllBooks() {
        // Given
        Author author = new Author("Test Author", "test@email.com", "Test Country");
        Book book1 = new Book("Book 1", "1234567890", "Fiction", BigDecimal.valueOf(19.99), author);
        Book book2 = new Book("Book 2", "0987654321", "Fantasy", BigDecimal.valueOf(24.99), author);
        List<Book> books = Arrays.asList(book1, book2);
        
        when(bookRepository.findAll()).thenReturn(books);
        
        // When
        List<Book> result = bookService.getAllBooks();
        
        // Then
        assertEquals(2, result.size());
        verify(bookRepository, times(1)).findAll();
    }
    
    @Test
    public void testGetBooksByGenre() {
        // Given
        Author author = new Author("Test Author", "test@email.com", "Test Country");
        Book book1 = new Book("Fantasy Book", "1111111111", "Fantasy", BigDecimal.valueOf(19.99), author);
        Book book2 = new Book("Another Fantasy", "2222222222", "Fantasy", BigDecimal.valueOf(21.99), author);
        List<Book> fantasyBooks = Arrays.asList(book1, book2);
        
        when(bookRepository.findByGenre("Fantasy")).thenReturn(fantasyBooks);
        
        // When
        List<Book> result = bookService.getBooksByGenre("Fantasy");
        
        // Then
        assertEquals(2, result.size());
        assertEquals("Fantasy", result.get(0).getGenre());
        verify(bookRepository, times(1)).findByGenre("Fantasy");
    }
    
    @Test
    public void testSaveBook() {
        // Given
        Author author = new Author("Test Author", "test@email.com", "Test Country");
        Book book = new Book("New Book", "9999999999", "Mystery", BigDecimal.valueOf(15.99), author);
        
        when(bookRepository.save(book)).thenReturn(book);
        
        // When
        Book result = bookService.saveBook(book);
        
        // Then
        assertNotNull(result);
        assertEquals("New Book", result.getTitle());
        verify(bookRepository, times(1)).save(book);
    }
}