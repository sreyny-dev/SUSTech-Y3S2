package com.example.demo_student.testController;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/testcontroller")
public class testController {
    @GetMapping(value = "/cs304")
    public String hello(){
        return "hello cs304";
    }
}
