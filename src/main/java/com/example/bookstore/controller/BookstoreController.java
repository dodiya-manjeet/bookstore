package com.example.bookstore.controller;

import com.example.bookstore.model.Author;
import com.example.bookstore.model.Book;
import com.example.bookstore.service.AuthorService;
import com.example.bookstore.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Controller
public class BookstoreController {
    
    @Autowired
    private AuthorService authorService;
    
    @Autowired
    private BookService bookService;
    
    // Home page
    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("authorsCount", authorService.getAllAuthors().size());
        model.addAttribute("booksCount", bookService.getAllBooks().size());
        return "index";
    }
    
    // Author operations
    @GetMapping("/authors")
    public String listAuthors(Model model) {
        model.addAttribute("authors", authorService.getAllAuthors());
        return "authors/list";
    }
    
    @GetMapping("/authors/add")
    public String showAddAuthorForm(Model model) {
        model.addAttribute("author", new Author());
        return "authors/add";
    }
    
    @PostMapping("/authors/add")
    public String addAuthor(@ModelAttribute Author author, RedirectAttributes redirectAttributes) {
        try {
            authorService.saveAuthor(author);
            redirectAttributes.addFlashAttribute("successMessage", "Author added successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error adding author: " + e.getMessage());
        }
        return "redirect:/authors";
    }
    
    @GetMapping("/authors/edit/{id}")
    public String showEditAuthorForm(@PathVariable Long id, Model model) {
        Optional<Author> author = authorService.getAuthorById(id);
        if (author.isPresent()) {
            model.addAttribute("author", author.get());
            return "authors/edit";
        } else {
            model.addAttribute("errorMessage", "Author not found with id: " + id);
            return "redirect:/authors";
        }
    }
    
    @PostMapping("/authors/edit/{id}")
    public String updateAuthor(@PathVariable Long id, @ModelAttribute Author author, RedirectAttributes redirectAttributes) {
        try {
            authorService.updateAuthor(id, author);
            redirectAttributes.addFlashAttribute("successMessage", "Author updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating author: " + e.getMessage());
        }
        return "redirect:/authors";
    }
    
    // Book operations
    @GetMapping("/books")
    public String listBooks(Model model) {
        model.addAttribute("books", bookService.getAllBooks());
        return "books/list";
    }
    
    @GetMapping("/books/add")
    public String showAddBookForm(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("authors", authorService.getAllAuthors());
        return "books/add";
    }
    
    @PostMapping("/books/add")
    public String addBook(@ModelAttribute Book book, 
                         @RequestParam Long authorId,
                         RedirectAttributes redirectAttributes) {
        try {
            Optional<Author> author = authorService.getAuthorById(authorId);
            if (author.isPresent()) {
                book.setAuthor(author.get());
                bookService.saveBook(book);
                redirectAttributes.addFlashAttribute("successMessage", "Book added successfully!");
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Author not found!");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error adding book: " + e.getMessage());
        }
        return "redirect:/books";
    }
    
    @GetMapping("/books/edit/{id}")
    public String showEditBookForm(@PathVariable Long id, Model model) {
        Optional<Book> book = bookService.getBookById(id);
        if (book.isPresent()) {
            model.addAttribute("book", book.get());
            model.addAttribute("authors", authorService.getAllAuthors());
            return "books/edit";
        } else {
            model.addAttribute("errorMessage", "Book not found with id: " + id);
            return "redirect:/books";
        }
    }
    
    @PostMapping("/books/edit/{id}")
    public String updateBook(@PathVariable Long id, 
                           @ModelAttribute Book book,
                           @RequestParam Long authorId,
                           RedirectAttributes redirectAttributes) {
        try {
            Optional<Author> author = authorService.getAuthorById(authorId);
            if (author.isPresent()) {
                book.setAuthor(author.get());
                bookService.updateBook(id, book);
                redirectAttributes.addFlashAttribute("successMessage", "Book updated successfully!");
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Author not found!");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating book: " + e.getMessage());
        }
        return "redirect:/books";
    }
    
    // Custom query - Books with Authors (Inner Join) - ADD THIS METHOD
    @GetMapping("/books-with-authors")
    public String getBooksWithAuthors(Model model) {
        try {
            List<Object[]> results = bookService.getBooksWithAuthors();
            model.addAttribute("booksWithAuthors", results);
            return "books/books-with-authors";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error fetching books with authors: " + e.getMessage());
            return "books/books-with-authors";
        }
    }
    
    // Test page - keep this for verification
    @GetMapping("/test")
    public String testPage() {
        return "test";
    }
}