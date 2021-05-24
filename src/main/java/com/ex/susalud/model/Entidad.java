package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "entidad")
@Getter
@Setter
public class Entidad {
    public Entidad() {
    }

    public Entidad(int id) {
        this.id = id;
    }

    public Entidad(int id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_entidad")
    private int id;

    @Column(name = "descripcion")
    private String descripcion;
}
