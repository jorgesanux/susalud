package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "tecnica_evaluativa")
@Getter
@Setter
public class TecnicaEvaluativa {
    public TecnicaEvaluativa() { }

    public TecnicaEvaluativa(int id) {
        this.id = id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_tecnica")
    private int id;

    @Column(name="descripcion",length = 45)
    private String descripcion;
}
