package com.ex.susalud.repository;

import com.ex.susalud.model.PosicionSupervision;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PosicionSupervisionRepository extends JpaRepository<PosicionSupervision,Integer> {
    List<PosicionSupervision> findBySupervisionId(int supervisionId);
    Optional<PosicionSupervision> findBySupervisionIdAndId(int supervisionId, int idPosicionSupervision);
}
