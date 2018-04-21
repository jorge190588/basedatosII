alter table clientes 
add constraint cliente_clasificacion_ID_fk 
foreign key (Clasificacion_ID) 
references Clasificacion(IdClasificacion)