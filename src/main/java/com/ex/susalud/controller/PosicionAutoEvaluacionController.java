package com.ex.susalud.controller;

import com.ex.susalud.model.PosicionAutoEvaluacion;
import com.ex.susalud.repository.PosicionAutoEvaluacionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("autoevaluacion/{idAutoevaluacion}/posicion")
public class PosicionAutoEvaluacionController {
    private static final String PATH_ID = "/{idPosicionAutoevaluacion}";

    @Autowired
    private PosicionAutoEvaluacionRepository posicionAutoEvaluacionRepository;

    @GetMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<PosicionAutoEvaluacion>> getAllPosicionAutoEvaluacion(@PathVariable(value = "idAutoevaluacion") int idAutoevaluacion){
        return new ResponseEntity<>(posicionAutoEvaluacionRepository.findByAutoEvaluacionId(idAutoevaluacion), HttpStatus.OK);
    }

    @GetMapping(
            path = PATH_ID,
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    public ResponseEntity<PosicionAutoEvaluacion> getPosicionAutoEvaluacionById(
            @PathVariable(value = "idAutoevaluacion") int idAutoevaluacion,
            @PathVariable(value = "idPosicionAutoevaluacion") int idPosicionAutoevaluacion){
        return new ResponseEntity<>(posicionAutoEvaluacionRepository.findByAutoEvaluacionIdAndId(idAutoevaluacion,idPosicionAutoevaluacion).get(), HttpStatus.OK);
    }

    @PostMapping(
            produces = {MediaType.APPLICATION_JSON_VALUE},
            consumes = {MediaType.APPLICATION_JSON_VALUE}
    )
    public ResponseEntity<PosicionAutoEvaluacion> createPosicionAutoEvaluacion(
            @PathVariable(value = "idAutoevaluacion") int idAutoevaluacion,
            @RequestBody PosicionAutoEvaluacion posicionAutoEvaluacion){
        int idPosicionAutoevaluacion = posicionAutoEvaluacionRepository.save(posicionAutoEvaluacion).getId();
        return getPosicionAutoEvaluacionById(idAutoevaluacion,idPosicionAutoevaluacion);
    }

    @DeleteMapping(
            path = PATH_ID
    )
    public ResponseEntity<PosicionAutoEvaluacion> deletePosicionAutoEvaluacionById(
            @PathVariable(value = "idAutoevaluacion") int idAutoevaluacion,
            @PathVariable(value = "idPosicionAutoevaluacion") int idPosicionAutoevaluacion){
        posicionAutoEvaluacionRepository.deleteByAutoEvaluacionIdAndId(idAutoevaluacion,idPosicionAutoevaluacion);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }
}
