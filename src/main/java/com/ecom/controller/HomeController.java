package com.ecom.controller;

import com.ecom.repository.ProductRepository;
import com.ecom.service.CartService;
import com.ecom.service.CategoryService;
import com.ecom.service.ProductService;
import com.ecom.service.UserService;
import com.ecom.util.CommonUtil;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;

import com.ecom.model.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Controller
public class HomeController {


    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private CommonUtil commonUtil;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @ModelAttribute
    public void getUserDetails(Principal p, Model m){
        if(p!=null){
            String email = p.getName();
            UserDtls userDtls = userService.getUserByEmail(email);
            m.addAttribute("user", userDtls);
        } else {
            m.addAttribute("user",null);
        }

        List<Category> allActiveCategory = categoryService.getAllActiveCategory();
        m.addAttribute("categorys",allActiveCategory);
    }

    @GetMapping("/index")
    public String index(){
        return "index";
    }

//    @GetMapping("/login")
    @GetMapping("/signin")
    public String login(){
        return "login";
    }

    @GetMapping("/register")
    public String register(){
        return "register";
    }

    @GetMapping("/products")
    public String products(Model m, @RequestParam(value="category", defaultValue="") String category){
        //System.out.println("category="+category);
        List<Category> categories = categoryService.getAllActiveCategory();
        List<Product> products = productService.getAllActiveProducts(category);
        m.addAttribute("categories",categories);
        m.addAttribute("products",products);
        m.addAttribute("paramValue",category);
        return "product";
    }

    @GetMapping("/view_product/{id}")
    public String view_product(@PathVariable int id, Model m){
        Product productById = productService.getProductById(id);
        m.addAttribute("product", productById);
        return "view_product";
    }

    @PostMapping("/saveUser")
    public String saveUser(@ModelAttribute UserDtls user, @RequestParam("img") MultipartFile file, HttpSession session) throws IOException {
        String imageName = file.isEmpty() ? "default.jpg" : file.getOriginalFilename();
        user.setProfileImage(imageName);
        UserDtls saveUser = userService.saveUser(user);
        if(!ObjectUtils.isEmpty(saveUser)){
            if(!file.isEmpty()){
                File saveFile = new ClassPathResource("static/img").getFile();
                Path path = Paths.get(saveFile.getAbsolutePath() + File.separator + "profile_img" + File.separator + file.getOriginalFilename());
                Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
            }
            session.setAttribute("succMsg",  "Saved Successfully");
        } else {
            session.setAttribute("errorMsg", "Something went wrong on the server");
        }

        return "redirect:/register";
    }

    // Forgot Password Code
    @GetMapping("/forgot_password")
    public String showForgotPassword(){
        return "forgot_password";
        // return "forgot_password.html"   <<--- can also add .html
    }

    @PostMapping("/forgot_password")
    public String processForgot_password(@RequestParam String email, HttpSession session, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
        UserDtls userByEmail = userService.getUserByEmail(email);
        if(ObjectUtils.isEmpty(userByEmail)){
            session.setAttribute("errorMsg", "Invalid email");
        }else{

            String resetToken = UUID.randomUUID().toString();
            userService.updateUserResetToken(email,resetToken);

            // Generate URL : http://localhost:8080/reset-password?token=fjnekwfu2q3r3982
            String url = commonUtil.generateUrl(request) + "/reset_password?token=" + resetToken;

            //TODO careful setup sendmail because of credential leak (env/gitignore)
            //Boolean sendMail = commonUtil.sendMail(url, email);
            Boolean sendMail = true;
            if(sendMail){
                session.setAttribute("succMsg", "Please check your email.. Password Reset link");
            } else {
                session.setAttribute("errorMsg", "Something wrong on server ! Email not send");
            }
        }
        return "redirect:/forgot_password";
    }

    @GetMapping("/reset_password")
    public String showResetPassword(@RequestParam String token, HttpSession session, Model m){
        UserDtls userByToken = userService.getUserByToken(token);
        if(userByToken==null){
            m.addAttribute("msg", "Your link is invalid or expired!");
            return "message";
        }
        m.addAttribute("token",token);
        return "reset_password";
    }

    @PostMapping("/reset_password")
    public String showResetPassword(@RequestParam String token,@RequestParam String password, HttpSession session, Model m){
        UserDtls userByToken = userService.getUserByToken(token);
        if(userByToken==null){
            m.addAttribute("msg", "Your link is invalid or expired!");
            return "message";
        } else{
            userByToken.setPassword(passwordEncoder.encode(password));
            userByToken.setResetToken(null);
            userService.updateUser(userByToken);
            m.addAttribute("msg", "Password change successfully");
            return "message";
        }
    }

}
