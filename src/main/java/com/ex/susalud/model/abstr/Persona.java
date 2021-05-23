package com.ex.susalud.model.abstr;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
@Getter
@Setter
public abstract class Persona {
    @Id
    @Column(name = "documento",length = 45)
    private String documento;

    @Column(name="nombre",length = 45)
    private String nombre;

    @Column(name="apellido",length = 45)
    private String apellido;
}
