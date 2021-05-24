package com.ex.susalud.model;

import com.ex.susalud.model.abstr.AbstractProceso;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "macro_proceso")
public class MacroProceso extends AbstractProceso {
    public MacroProceso() {
    }

    public MacroProceso(int id) {
        super(id);
    }
}
