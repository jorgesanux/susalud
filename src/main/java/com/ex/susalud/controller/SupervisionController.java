package com.ex.susalud.controller;

import com.ex.susalud.model.PosicionSupervision;
import com.ex.susalud.model.Supervision;
import com.ex.susalud.repository.PosicionSupervisionRepository;
import com.ex.susalud.repository.SupervisionRepository;
import com.ex.susalud.service.SupervisionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.List;

@RestController
@RequestMapping("supervision")
public class SupervisionController {
    private static final String PATH_ID = "/{idSupervision}";

    @Autowired
    private SupervisionRepository supervisionRepository;

    @Autowired
    private SupervisionService supervisionService;

    @GetMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<List<Supervision>> getAllSupervisiones(){
        return new ResponseEntity<>(supervisionRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping(
            path = PATH_ID,
            produces = {MediaType.APPLICATION_JSON_VALUE}
    )
    public ResponseEntity<Supervision> getSupervisionById(@PathVariable(value = "idSupervision") int idSupervision){
        return new ResponseEntity<>(supervisionRepository.findById(idSupervision).get(), HttpStatus.OK);
    }

    @PostMapping(
            produces = {MediaType.APPLICATION_JSON_VALUE},
            consumes = {MediaType.APPLICATION_JSON_VALUE}
    )
    public ResponseEntity<Supervision> createSupervisionById(@RequestBody Supervision supervision){
        int idSupervision = supervisionRepository.save(supervision).getId();
        return getSupervisionById(idSupervision);
    }

    @DeleteMapping(
            path = PATH_ID
    )
    public ResponseEntity<PosicionSupervision> deleteSupervisionById(
            @PathVariable(value = "idSupervision") int idSupervision) {
        supervisionService.deleteSupervisionById(idSupervision);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }
}
