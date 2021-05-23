package com.ex.susalud.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class MainController {
    @GetMapping()
    public String getMain(){
        return "<h1>SuSalud API v1.0</h1>";
    }
}
