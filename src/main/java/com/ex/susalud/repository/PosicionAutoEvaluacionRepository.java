package com.ex.susalud.repository;

import com.ex.susalud.model.PosicionAutoEvaluacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
public interface PosicionAutoEvaluacionRepository extends JpaRepository<PosicionAutoEvaluacion,Integer> {
    List<PosicionAutoEvaluacion> findByAutoEvaluacionId(int idPosicionAutoevaluacion);
    Optional<PosicionAutoEvaluacion> findByAutoEvaluacionIdAAndId(int idAutoevaluacion,int idPosicionAutoevaluacion);

    @Transactional
    void deleteByAutoEvaluacionIdAndId(int idAutoevaluacion,int idPosicionAutoevaluacion);

    @Transactional
    void deleteByAutoEvaluacionId(int idAutoevaluacion);
}
