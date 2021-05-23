package com.ex.susalud.repository;

import com.ex.susalud.model.Supervision;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RestController;

@RestController
public interface SupervisionRepository extends JpaRepository<Supervision,Integer> {
}
