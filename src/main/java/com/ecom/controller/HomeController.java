package com.ecom.controller;

import com.ecom.repository.ProductRepository;
import com.ecom.service.CategoryService;
import com.ecom.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ecom.model.*;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

    @GetMapping("/index")
    public String index(){
        return "index";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/register")
    public String register(){
        return "register";
    }

    @GetMapping("/products")
    public String products(Model m){
        List<Category> categories = categoryService.getAllActiveCategory();
        List<Product> products = productService.getAllActiveProducts();
        m.addAttribute("categories",categories);
        m.addAttribute("products",products);
        return "product";
    }

    @GetMapping("/view_product")
    public String view_product(){
        return "view_product";
    }
}
