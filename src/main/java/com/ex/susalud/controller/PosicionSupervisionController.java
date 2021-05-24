package com.ex.susalud.controller;

import com.ex.susalud.model.PosicionSupervision;
import com.ex.susalud.repository.PosicionSupervisionRepository;
import com.ex.susalud.repository.SupervisionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("supervision/{idSupervision}/posicion")
public class PosicionSupervisionController {
    private static final String PATH_ID = "/{idPosicionSupervision}";

    @Autowired
    private PosicionSupervisionRepository posicionSupervisionRepository;

    @GetMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<PosicionSupervision>> getAllPosicionesSupervision(@PathVariable(value = "idSupervision") int idSupervision){
        return new ResponseEntity<>(posicionSupervisionRepository.findBySupervisionId(idSupervision), HttpStatus.OK);
    }

    @GetMapping(
            path = PATH_ID,
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    public ResponseEntity<PosicionSupervision> getPosicionSupervisionById(@PathVariable(value = "idPosicionSupervision") int idPosicionSupervision){
        return new ResponseEntity<>(posicionSupervisionRepository.findById(idPosicionSupervision).get(), HttpStatus.OK);
    }

    @PostMapping(
            produces = {MediaType.APPLICATION_JSON_VALUE},
            consumes = {MediaType.APPLICATION_JSON_VALUE}
    )
    public ResponseEntity<PosicionSupervision> createPosicionSupervision(@RequestBody PosicionSupervision posicionSupervision){
        int idPosicionSupervision = posicionSupervisionRepository.save(posicionSupervision).getId();
        return getPosicionSupervisionById(idPosicionSupervision);
    }

}
