package com.ex.susalud.model.abstr;

import javax.persistence.*;

@MappedSuperclass
public abstract class AbstractProceso {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_proceso")
    private int id;

    @Column(name="descripcion",length = 45)
    private String descripcion;
}
