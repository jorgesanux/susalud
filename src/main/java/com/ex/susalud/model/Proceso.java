package com.ex.susalud.model;

import com.ex.susalud.model.abstr.AbstractProceso;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "proceso")
@Getter
@Setter
public class Proceso extends AbstractProceso { }
