package com.ex.susalud.controller;

import com.ex.susalud.model.AutoEvaluacion;
import com.ex.susalud.model.PosicionSupervision;
import com.ex.susalud.model.Supervision;
import com.ex.susalud.repository.AutoEvaluacionRepository;
import com.ex.susalud.service.AutoEvaluacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("autoevaluacion")
public class AutoEvaluacionController {
    private static final String PATH_ID = "/{idAutoevaluacion}";

    @Autowired
    private AutoEvaluacionRepository autoEvaluacionRepository;

    @Autowired
    private AutoEvaluacionService autoEvaluacionService;

    @GetMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<AutoEvaluacion>> getAllAutoEvaluaciones(){
        return new ResponseEntity<>(autoEvaluacionRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping(
            path = PATH_ID,
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    public ResponseEntity<AutoEvaluacion> getAutoEvaluacionById(@PathVariable(value = "idAutoevaluacion") int idAutoevaluacion){
        return new ResponseEntity<>(autoEvaluacionRepository.findById(idAutoevaluacion).get(), HttpStatus.OK);
    }

    @PostMapping(
            produces = {MediaType.APPLICATION_JSON_VALUE},
            consumes = {MediaType.APPLICATION_JSON_VALUE}
    )
    public ResponseEntity<AutoEvaluacion> createAutoEvaluacioId(@RequestBody AutoEvaluacion autoEvaluacion){
        int idAutoevaluacion = autoEvaluacionRepository.save(autoEvaluacion).getId();
        return getAutoEvaluacionById(idAutoevaluacion);
    }

    @DeleteMapping(
            path = PATH_ID
    )
    public ResponseEntity<AutoEvaluacion> deleteAutoEvaluacioById(
            @PathVariable(value = "idAutoevaluacion") int idAutoevaluacion) {
        autoEvaluacionService.deleteAutoEvaluacioById(idAutoevaluacion);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }
}
