package com.ex.susalud.controller;

import com.ex.susalud.model.Supervision;
import com.ex.susalud.repository.SupervisionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("supervision")
public class SupervisionController {
    @Autowired
    private SupervisionRepository supervisionRepository;

    @GetMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<Supervision>> getAllSupervisiones(){
        return new ResponseEntity<>(supervisionRepository.findAll(), HttpStatus.OK);
    }
}
