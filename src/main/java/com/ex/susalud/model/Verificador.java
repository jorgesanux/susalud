package com.ex.susalud.model;
import com.ex.susalud.model.abstr.Persona;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "verificador")
@Getter
@Setter
public class Verificador extends Persona { }
