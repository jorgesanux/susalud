package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "autoevaluacion")
@Getter
@Setter
public class AutoEvaluacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_autoeva")
    private int id;

    @Column(name = "cantidad_avance")
    private int cantidadAvance;

    @Column(name = "cantidad_total")
    private int cantidadTotal;

    @Column(name = "fecha")
    private LocalDate fecha;

    @OneToOne
    @JoinColumn(name = "id_etapa",referencedColumnName = "id_etapa")
    private Etapa id_etapa;

    @OneToOne
    @JoinColumn(name = "id_estado",referencedColumnName = "id_estado")
    private EstadoAutoEvaluacion id_estado;

}
