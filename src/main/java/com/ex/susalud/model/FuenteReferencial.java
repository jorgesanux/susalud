package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "fuente_referencial")
@Getter
@Setter
public class FuenteReferencial {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_fuente")
    private int id;

    @Column(name="descripcion",length = 45)
    private String descripcion;
}
