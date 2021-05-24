package com.ex.susalud.model;
import com.ex.susalud.model.abstr.Persona;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "verificador")
public class Verificador extends Persona {
    public Verificador() {
    }

    public Verificador(String documento) {
        super(documento);
    }
}
