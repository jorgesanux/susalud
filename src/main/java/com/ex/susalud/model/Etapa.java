package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "etapa")
@Getter
@Setter
public class Etapa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_etapa")
    private int id;

    @Column(name = "descripcion",length = 45)
    private String descripcion;

    @Column(name = "anho")
    private int anho;
}
