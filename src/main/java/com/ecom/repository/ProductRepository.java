package com.ecom.repository;

import com.ecom.model.Product;
import com.ecom.model.UserDtls;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Integer> {

     List<Product> findByIsActiveTrue();
     List<Product> findByCategory(String category);
     public Optional<Product> findById(Integer id);
}
