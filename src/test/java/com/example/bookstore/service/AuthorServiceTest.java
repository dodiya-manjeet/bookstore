package com.example.bookstore.service;

import com.example.bookstore.model.Author;
import com.example.bookstore.repository.AuthorRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class AuthorServiceTest {
    
    @Mock
    private AuthorRepository authorRepository;
    
    @InjectMocks
    private AuthorService authorService;
    
    @Test
    public void testGetAllAuthors() {
        // Given
        Author author1 = new Author("Author 1", "author1@email.com", "Country 1");
        Author author2 = new Author("Author 2", "author2@email.com", "Country 2");
        List<Author> authors = Arrays.asList(author1, author2);
        
        when(authorRepository.findAll()).thenReturn(authors);
        
        // When
        List<Author> result = authorService.getAllAuthors();
        
        // Then
        assertEquals(2, result.size());
        verify(authorRepository, times(1)).findAll();
    }
    
    @Test
    public void testGetAuthorById() {
        // Given
        Author author = new Author("Test Author", "test@email.com", "Test Country");
        author.setId(1L);
        
        when(authorRepository.findById(1L)).thenReturn(Optional.of(author));
        
        // When
        Optional<Author> result = authorService.getAuthorById(1L);
        
        // Then
        assertTrue(result.isPresent());
        assertEquals("Test Author", result.get().getName());
        verify(authorRepository, times(1)).findById(1L);
    }
    
    @Test
    public void testSaveAuthor() {
        // Given
        Author author = new Author("New Author", "new@email.com", "New Country");
        
        when(authorRepository.save(author)).thenReturn(author);
        
        // When
        Author result = authorService.saveAuthor(author);
        
        // Then
        assertNotNull(result);
        assertEquals("New Author", result.getName());
        verify(authorRepository, times(1)).save(author);
    }
}