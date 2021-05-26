drop procedure if exists insertGenericData;
create procedure insertGenericData(in tableName varchar(20), in columnName varchar(20),in prefix varchar(40),in quantity int,in deleteAll boolean)
begin
    declare i int default 1;

    if deleteAll=true then
        set @query = concat('delete from ',tableName);
        PREPARE stmt FROM @query;
        EXECUTE stmt;
    end if;

    WHILE(i<=quantity) do
        set @query = concat('insert into ',tableName,'(',columnName,') values(\'',concat(prefix,' ',i),'\');');
        PREPARE stmt FROM @query;
        EXECUTE stmt;
        set i := i+1;
    end while;
end;

-- ETAPA
insert into etapa(anho, descripcion) values(2016,'Primer Semestre');
insert into etapa(anho, descripcion) values(2016,'Segundo Semestre');
insert into etapa(anho, descripcion) values(2017,'Primer Semestre');

-- ESTADO AUTOEVALUACION
insert into estado_autoevaluacion(descripcion) values('Pendiente de cierre');
insert into estado_autoevaluacion(descripcion) values('Por evaluar');
insert into estado_autoevaluacion(descripcion) values('Cerrado');

-- EVALUADOR
insert into evaluador(documento, apellido, nombre) values('123456789','Sanchez','Andres');
insert into evaluador(documento, apellido, nombre) values('987654321','Sanabria','Jorge');
insert into evaluador(documento, apellido, nombre) values('147258963','Perez','Luisa');

-- VERIFICADOR
insert into verificador(documento, apellido, nombre) values('357895146','Velandia','Andrea');
insert into verificador(documento, apellido, nombre) values('248761582','Rodriguez','Jhon');
insert into verificador(documento, apellido, nombre) values('324894135','Villamil','Daniela');

-- SUBPROCESO
call insertGenericData('sub_proceso','descripcion','Subproceso',20,true);

-- PROCESO
call insertGenericData('proceso','descripcion','Proceso',20,true);

-- MACROPROCESO
call insertGenericData('macro_proceso','descripcion','Macro proceso',20,true);

-- TECNICA EVALUATIVA
call insertGenericData('tecnica_evaluativa','descripcion','Tecnica evaluativa',20,true);

-- FUENTE REFERENCIAL
call insertGenericData('fuente_referencial','descripcion','Fuente Referencial',20,true);

-- CRITERIO PUNTUACION
call insertGenericData('criterio_puntuacion','descripcion','Criterio',20,true);

-- PLAN
call insertGenericData('plan','descripcion','Plan',20,true);

-- ENTIDAD
call insertGenericData('entidad','descripcion','Entidad',20,true);


insert into supervision(cantidad_avance, fecha, modalidad, tipo, tipo_intervencion, total_avance, id_entidad, id_etapa, id_plan)
    values(1,current_date,'INTEGRAL','FISCALIZADORA','SELECTIVA',12,4,3,10);
insert into supervision(cantidad_avance, fecha, modalidad, tipo, tipo_intervencion, total_avance, id_entidad, id_etapa, id_plan)
    values(6,current_date,'INTEGRAL','FISCALIZADORA','SELECTIVA',12,4,2,15);
insert into supervision(cantidad_avance, fecha, modalidad, tipo, tipo_intervencion, total_avance, id_entidad, id_etapa, id_plan)
    values(9,current_date,'INTEGRAL','FISCALIZADORA','SELECTIVA',12,4,1,8);

insert into posicion_supervision(observaciones, puntuacion, id_macro_proceso, id_proceso, id_sub_proceso, id_supervision, doc_verificador)
    values('No posee capacidad',10,1,2,3,1,'357895146');
insert into posicion_supervision(observaciones, puntuacion, id_macro_proceso, id_proceso, id_sub_proceso, id_supervision, doc_verificador)
    values('No es viable',5,2,3,4,2,'324894135');
insert into posicion_supervision(observaciones, puntuacion, id_macro_proceso, id_proceso, id_sub_proceso, id_supervision, doc_verificador)
    values('No es viable',8,20,16,15,2,'248761582');
insert into posicion_supervision(observaciones, puntuacion, id_macro_proceso, id_proceso, id_sub_proceso, id_supervision, doc_verificador)
    values('No es viable',8,20,16,15,3,'324894135');

insert into tecnica_x_supervision(id_pos_supervision, id_tecnica) values(1,1);
insert into tecnica_x_supervision(id_pos_supervision, id_tecnica) values(1,2);
insert into tecnica_x_supervision(id_pos_supervision, id_tecnica) values(1,3);
insert into tecnica_x_supervision(id_pos_supervision, id_tecnica) values(2,4);
insert into tecnica_x_supervision(id_pos_supervision, id_tecnica) values(2,5);
insert into tecnica_x_supervision(id_pos_supervision, id_tecnica) values(2,6);
insert into tecnica_x_supervision(id_pos_supervision, id_tecnica) values(3,7);
insert into tecnica_x_supervision(id_pos_supervision, id_tecnica) values(3,8);
insert into tecnica_x_supervision(id_pos_supervision, id_tecnica) values(3,9);

insert into fuente_x_supervision(id_pos_supervision, id_fuente) values(1,1);
insert into fuente_x_supervision(id_pos_supervision, id_fuente) values(1,2);
insert into fuente_x_supervision(id_pos_supervision, id_fuente) values(1,3);
insert into fuente_x_supervision(id_pos_supervision, id_fuente) values(2,4);
insert into fuente_x_supervision(id_pos_supervision, id_fuente) values(2,5);
insert into fuente_x_supervision(id_pos_supervision, id_fuente) values(2,6);
insert into fuente_x_supervision(id_pos_supervision, id_fuente) values(3,7);
insert into fuente_x_supervision(id_pos_supervision, id_fuente) values(3,8);
insert into fuente_x_supervision(id_pos_supervision, id_fuente) values(3,9);

insert into criterio_x_supervision(id_pos_supervision, id_criterio) values(1,1);
insert into criterio_x_supervision(id_pos_supervision, id_criterio) values(1,2);
insert into criterio_x_supervision(id_pos_supervision, id_criterio) values(1,3);
insert into criterio_x_supervision(id_pos_supervision, id_criterio) values(2,4);
insert into criterio_x_supervision(id_pos_supervision, id_criterio) values(2,5);
insert into criterio_x_supervision(id_pos_supervision, id_criterio) values(2,6);
insert into criterio_x_supervision(id_pos_supervision, id_criterio) values(3,7);
insert into criterio_x_supervision(id_pos_supervision, id_criterio) values(3,8);
insert into criterio_x_supervision(id_pos_supervision, id_criterio) values(3,9);

insert into autoevaluacion(cantidad_avance, cantidad_total, fecha, id_estado, id_etapa)
    values(5,20,current_date,1,1);
insert into autoevaluacion(cantidad_avance, cantidad_total, fecha, id_estado, id_etapa)
    values(10,20,current_date,2,2);
insert into autoevaluacion(cantidad_avance, cantidad_total, fecha, id_estado, id_etapa)
    values(15,20,current_date,3,3);
