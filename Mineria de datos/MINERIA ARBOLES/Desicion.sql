SELECT P.nombre,P.idMarca,C.nombreCliente,SD.idSalidaDetalle,
sd.idProducto,sd.idSalida,s.idCliente,s.idSalida,m.idMunicipio,d.idDepartamento,
SD.cantidad,SD.precio, Year(S.fecha) as Año, SD.idSalida,
M.nombreMunicipio,D.nombreDepartamento,SU.nombreSucursal

FROM Productos P, Salida S, SalidaDetalle SD,Clientes C, 
Municipio M, Departamento D, Sucursal SU
where p.id=sd.idProducto and sd.idSalida=s.idSalida and s.idCliente=C.idCliente and
C.idMunicipio=m.idMunicipio and m.idDepartamento=D.idDepartamento and
su.idMunicipio=m.idMunicipio