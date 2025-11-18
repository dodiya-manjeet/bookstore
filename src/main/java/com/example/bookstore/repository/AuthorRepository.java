package com.example.bookstore.repository;

import com.example.bookstore.model.Author;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface AuthorRepository extends JpaRepository<Author, Long> {
    
    Optional<Author> findByEmail(String email);
    
    List<Author> findByCountry(String country);
    
    @Query("SELECT a FROM Author a WHERE LOWER(a.name) LIKE LOWER(CONCAT('%', :name, '%'))")
    List<Author> findByNameContainingIgnoreCase(String name);
    
    // Custom inner join query
    @Query("SELECT a FROM Author a JOIN a.books b WHERE b.genre = :genre")
    List<Author> findAuthorsByBookGenre(String genre);
}