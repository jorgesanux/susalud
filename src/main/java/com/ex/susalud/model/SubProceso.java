package com.ex.susalud.model;

import com.ex.susalud.model.abstr.AbstractProceso;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "sub_proceso")
@Getter
@Setter
public class SubProceso extends AbstractProceso {
}
