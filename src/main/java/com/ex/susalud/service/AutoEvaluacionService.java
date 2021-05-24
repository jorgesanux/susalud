package com.ex.susalud.service;

import com.ex.susalud.repository.AutoEvaluacionRepository;
import com.ex.susalud.repository.PosicionAutoEvaluacionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class AutoEvaluacionService {
    @Autowired
    private AutoEvaluacionRepository autoEvaluacionRepository;

    @Autowired
    private PosicionAutoEvaluacionRepository posicionAutoEvaluacionRepository;

    @Transactional
    public void deleteAutoEvaluacioById(int idAutoEvaluacion){
        posicionAutoEvaluacionRepository.deleteByAutoEvaluacionId(idAutoEvaluacion);
        autoEvaluacionRepository.deleteById(idAutoEvaluacion);
    }
}
