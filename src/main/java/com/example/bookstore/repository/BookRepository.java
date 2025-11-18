package com.example.bookstore.repository;

import com.example.bookstore.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    
    Optional<Book> findByIsbn(String isbn);
    
    List<Book> findByGenre(String genre);
    
    List<Book> findByTitleContainingIgnoreCase(String title);
    
    List<Book> findByAuthorId(Long authorId);
    
    // Custom inner join query - returns books with author information
    @Query("SELECT b, a FROM Book b JOIN b.author a")
    List<Object[]> findBooksWithAuthors();
    
    @Query("SELECT b FROM Book b WHERE b.price BETWEEN :minPrice AND :maxPrice")
    List<Book> findByPriceBetween(Double minPrice, Double maxPrice);
}