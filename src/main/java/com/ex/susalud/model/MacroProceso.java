package com.ex.susalud.model;

import com.ex.susalud.model.abstr.AbstractProceso;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "macro_proceso")
@Getter
@Setter
public class MacroProceso extends AbstractProceso {
}
