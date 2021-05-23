package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

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
    private AutoEvaluacion autoEvaluacion;

    @OneToOne
    @JoinColumn(name = "doc_evaluador",referencedColumnName = "documento")
    private Evaluador evaluador;

    @OneToOne
    @JoinColumn(name = "doc_verificador",referencedColumnName = "documento")
    private Verificador verificador;

    @OneToOne
    @JoinColumn(name = "id_macro_proceso",referencedColumnName = "id_proceso")
    private MacroProceso macroProceso;

    @OneToOne
    @JoinColumn(name = "id_proceso",referencedColumnName = "id_proceso")
    private Proceso proceso;

    @OneToOne
    @JoinColumn(name = "id_sub_proceso",referencedColumnName = "id_proceso")
    private SubProceso subProceso;

    @ManyToMany
    @JoinTable(
            name = "tecnica_x_autoevaluacion",
            joinColumns = @JoinColumn(name = "id_pos_autoeva"),
            inverseJoinColumns = @JoinColumn(name = "id_tecnica")
    )
    private Set<TecnicaEvaluativa> tecnicasEvaluativas;

    @ManyToMany
    @JoinTable(
            name = "fuente_x_autoevaluacion",
            joinColumns = @JoinColumn(name = "id_pos_autoeva"),
            inverseJoinColumns = @JoinColumn(name = "id_fuente")
    )
    private Set<FuenteReferencial> fuentesReferenciales;

    @ManyToMany
    @JoinTable(
            name = "criterio_x_autoevaluacion",
            joinColumns = @JoinColumn(name = "id_pos_autoeva"),
            inverseJoinColumns = @JoinColumn(name = "id_criterio")
    )
    private Set<CriterioPuntuacion> criteriosPuntuaciones;
}
