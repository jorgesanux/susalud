package com.ex.susalud.repository;

import com.ex.susalud.model.PosicionSupervision;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PosicionSupervisionRepository extends JpaRepository<PosicionSupervision,Integer> {
}
