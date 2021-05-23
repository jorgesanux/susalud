package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "criterio_puntuacion")
@Getter
@Setter
public class CriterioPuntuacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_criterio")
    private int id;

    @Column(name="descripcion",length = 45)
    private String descripcion;
}
