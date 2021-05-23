package com.ex.susalud.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "posicion_supervision")
@Getter
@Setter
public class PosicionSupervision {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pos_supervision")
    private int id;

//    @OneToOne
//    @JoinColumn(name = "id_supervision",referencedColumnName = "id_supervision")
//    private Supervision supervision;

    @OneToOne
    @JoinColumn(name = "id_macro_proceso",referencedColumnName = "id_proceso")
    private MacroProceso macroProceso;

    @OneToOne
    @JoinColumn(name = "id_proceso",referencedColumnName = "id_proceso")
    private Proceso proceso;

    @OneToOne
    @JoinColumn(name = "id_sub_proceso",referencedColumnName = "id_proceso")
    private SubProceso subProceso;

    @OneToOne
    @JoinColumn(name = "doc_verificador",referencedColumnName = "documento")
    private Verificador verificador;

    @Column(name = "puntuacion")
    private int puntuacion;

    @Column(name = "observaciones",columnDefinition = "TEXT")
    private String observaciones;

    @ManyToMany
    @JoinTable(
            name = "tecnica_x_supervision",
            joinColumns = @JoinColumn(name = "id_pos_supervision"),
            inverseJoinColumns = @JoinColumn(name = "id_tecnica")
    )
    private Set<TecnicaEvaluativa> tecnicasEvaluativas;

    @ManyToMany
    @JoinTable(
            name = "fuente_x_supervision",
            joinColumns = @JoinColumn(name = "id_pos_supervision"),
            inverseJoinColumns = @JoinColumn(name = "id_fuente")
    )
    private Set<FuenteReferencial> fuentesReferenciales;

    @ManyToMany
    @JoinTable(
            name = "criterio_x_supervision",
            joinColumns = @JoinColumn(name = "id_pos_supervision"),
            inverseJoinColumns = @JoinColumn(name = "id_criterio")
    )
    private Set<CriterioPuntuacion> criteriosPuntuaciones;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_supervision", nullable = false)
    @JsonIgnore
    private Supervision supervision;

}
