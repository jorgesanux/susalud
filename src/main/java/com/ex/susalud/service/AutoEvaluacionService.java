package com.ex.susalud.service;

import com.ex.susalud.repository.AutoEvaluacionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class AutoEvaluacionService {
    @Autowired
    private AutoEvaluacionRepository autoEvaluacionRepository;

    @Transactional
    public void deleteAutoEvaluacioById(int idAutoEvaluacion){
        //TODO agregar llamado para borrar las posiciones
        autoEvaluacionRepository.deleteById(idAutoEvaluacion);
    }
}
