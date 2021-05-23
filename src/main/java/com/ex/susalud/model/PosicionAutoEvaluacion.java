package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "posicion_autoevaluacion")
@Getter
@Setter
public class PosicionAutoEvaluacion  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pos_autoeva")
    private int id;

    @Column(name = "puntuacion")
    private int puntuacion;

    @Column(name = "observaciones")
    private String observaciones;

    @OneToOne
    @JoinColumn(name = "id_autoeva",referencedColumnName = "id_autoeva")
    private AutoEvaluacion id_autoeva;

    @OneToOne
    @JoinColumn(name = "doc_evaluador",referencedColumnName = "documento")
    private Evaluador doc_evaluador;

    @OneToOne
    @JoinColumn(name = "doc_verificador",referencedColumnName = "documento")
    private Verificador doc_verificador;

    @OneToOne
    @JoinColumn(name = "id_macro_proceso",referencedColumnName = "id_proceso")
    private MacroProceso id_macro_proceso;

    @OneToOne
    @JoinColumn(name = "id_proceso",referencedColumnName = "id_proceso")
    private Proceso id_proceso;

    @OneToOne
    @JoinColumn(name = "id_sub_proceso",referencedColumnName = "id_proceso")
    private SubProceso id_sub_proceso;

}
