package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "estado_autoevaluacion")
@Getter
@Setter
public class EstadoAutoEvaluacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_estado")
    private int id;

    @Column(name = "descripcion",length = 45)
    private String descripcion;
}
