package com.ecommerce.products.controller;

import com.ecommerce.products.entity.Product;
import com.ecommerce.products.repository.ProductRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/products")
@CrossOrigin("*")
public class ProductController {

    private final ProductRepository repository;

    public ProductController(
            ProductRepository repository) {

        this.repository = repository;
    }

    @GetMapping
    public List<Product> getAll() {

        return repository.findAll();
    }

    @GetMapping("/category/{id}")
    public List<Product> getByCategory(
            @PathVariable Long id) {

        return repository
                .findByCategoryId(id);
    }

    @PostMapping
    public Product create(
            @RequestBody Product product) {

        return repository.save(product);
    }
}