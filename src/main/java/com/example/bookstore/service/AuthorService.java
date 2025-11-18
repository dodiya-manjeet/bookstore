package com.example.bookstore.service;

import com.example.bookstore.model.Author;
import com.example.bookstore.repository.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class AuthorService {
    
    @Autowired
    private AuthorRepository authorRepository;
    
    public List<Author> getAllAuthors() {
        return authorRepository.findAll();
    }
    
    public Optional<Author> getAuthorById(Long id) {
        return authorRepository.findById(id);
    }
    
    public Author saveAuthor(Author author) {
        return authorRepository.save(author);
    }
    
    public Author updateAuthor(Long id, Author authorDetails) {
        Optional<Author> optionalAuthor = authorRepository.findById(id);
        if (optionalAuthor.isPresent()) {
            Author author = optionalAuthor.get();
            author.setName(authorDetails.getName());
            author.setEmail(authorDetails.getEmail());
            author.setCountry(authorDetails.getCountry());
            return authorRepository.save(author);
        }
        return null;
    }
    
    public void deleteAuthor(Long id) {
        authorRepository.deleteById(id);
    }
    
    public List<Author> getAuthorsByCountry(String country) {
        return authorRepository.findByCountry(country);
    }
    
    public List<Author> getAuthorsByBookGenre(String genre) {
        return authorRepository.findAuthorsByBookGenre(genre);
    }
    
    public Optional<Author> getAuthorByEmail(String email) {
        return authorRepository.findByEmail(email);
    }
}