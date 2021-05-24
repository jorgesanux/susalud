package com.ex.susalud.service;

import com.ex.susalud.repository.PosicionSupervisionRepository;
import com.ex.susalud.repository.SupervisionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class SupervisionService {

    @Autowired
    private SupervisionRepository supervisionRepository;

    @Autowired
    private PosicionSupervisionRepository posicionSupervisionRepository;

    @Transactional
    public void deleteSupervisionById(int idSupervision) throws DataIntegrityViolationException{
        posicionSupervisionRepository.deleteBySupervisionId(idSupervision);
        supervisionRepository.deleteById(idSupervision);
    }
}
