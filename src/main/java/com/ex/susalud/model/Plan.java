package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "plan")
@Getter
@Setter
public class Plan {
    public Plan() {}

    public Plan(int id) {
        this.id = id;
    }

    public Plan(int id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_plan")
    private int id;

    @Column(name = "descripcion")
    private String descripcion;
}
