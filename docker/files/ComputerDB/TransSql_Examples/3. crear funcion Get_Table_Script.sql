DROP FUNCTION [dbo].[Get_Table_Script]
Go
/*
Creado por: Jorge Salvador Santos Neill
Fecha: 11 07 2018
Descripcion: es una funcion que recibe de parametro el nombre de una tabla y devuelve el script para su creacion.
*/
Create Function Get_Table_Script
(
    @vsTableName varchar(50),
	@databaseName varchar(50),
	@schemeName varchar(50)
)

Returns
    VarChar(Max)
With ENCRYPTION

Begin

Declare @ScriptCommand varchar(Max), @hasPrimaryKey bit

if (len(@schemeName)>0) begin
	select @schemeName='[' + @schemeName + '].'
end else begin
	select @schemeName=''
end 

if (len(@databaseName)>0) begin
	select @databaseName='[' + @databaseName + '].'
end else begin
	select @databaseName=''
end 


select @hasPrimaryKey=count(*) from information_schema.table_constraints
where TABLE_NAME = @vsTableName

if (@hasPrimaryKey=1) begin
	Select @ScriptCommand =dbo.Get_Table_Script_With_Primary_Key(@vsTableName,@databaseName,@schemeName)
end else begin
	Select @ScriptCommand =dbo.Get_Table_Script_Without_Primary_Key(@vsTableName,@databaseName,@schemeName)
end

return @ScriptCommand 

end