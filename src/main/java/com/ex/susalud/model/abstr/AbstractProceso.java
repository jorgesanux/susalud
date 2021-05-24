package com.ex.susalud.model.abstr;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@MappedSuperclass
@Getter
@Setter
public abstract class AbstractProceso {

    public AbstractProceso() { }

    public AbstractProceso(int id) {
        this.id = id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_proceso")
    private int id;

    @Column(name="descripcion",length = 45)
    private String descripcion;
}
