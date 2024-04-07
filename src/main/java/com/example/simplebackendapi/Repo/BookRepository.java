package com.example.simplebackendapi.Repo;

import com.example.simplebackendapi.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book,Long> {
}
