package com.ex.susalud.controller;

import com.ex.susalud.model.PosicionSupervision;
import com.ex.susalud.repository.PosicionSupervisionRepository;
import com.ex.susalud.repository.SupervisionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("supervision/{idSupervision}/posicion")
public class PosicionSupervisionController {
    @Autowired
    private PosicionSupervisionRepository posicionSupervisionRepository;

    @GetMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<PosicionSupervision>> getAllPosicionesSupervision(@PathVariable(value = "idSupervision") int idSupervision){
        return new ResponseEntity<>(posicionSupervisionRepository.findBySupervisionId(idSupervision), HttpStatus.OK);
    }

}
