package com.ex.susalud.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

@Entity
@Table(name = "supervision")
@Getter
@Setter
public class Supervision {

    private enum Tipo{FISCALIZADORA,ORIENTATIVA}
    private enum Modalidad{INTEGRAL,SELECTIVA}
    private enum TipoIntervencion{INTEGRAL,SELECTIVA}

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_supervision")
    private int id;

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo",length = 20)
    private Tipo tipo;

    @Enumerated(EnumType.STRING)
    @Column(name = "modalidad",length = 20)
    private Modalidad modalidad;

    @Enumerated(EnumType.STRING)
    @Column(name = "tipo_intervencion",length = 20)
    private TipoIntervencion tipoIntervencion;

    @Column(name = "fecha")
    private LocalDate fecha;

    @Column(name = "cantidad_avance")
    private int cantidadAvance;

    @Column(name = "total_avance")
    private int totalAvance;

    @OneToOne
    @JoinColumn(name = "id_plan",referencedColumnName = "id_plan")
    private Plan id_plan;

    @OneToOne
    @JoinColumn(name = "id_etapa",referencedColumnName = "id_etapa")
    private Etapa id_etapa;

    @OneToOne
    @JoinColumn(name = "id_entidad",referencedColumnName = "id_entidad")
    private Entidad id_entidad;

//    @OneToMany(mappedBy = "id_pos_supervision")
//    private Set<PosicionSupervision> posicionesSupervisiones;

    @OneToMany(cascade = CascadeType.ALL,
            fetch = FetchType.LAZY,
            mappedBy = "supervision")
    private Set<PosicionSupervision> posicionesSupervisiones;

}
