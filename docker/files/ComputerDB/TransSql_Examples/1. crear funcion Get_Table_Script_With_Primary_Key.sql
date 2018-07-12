--DROP FUNCTION [dbo].[Get_Table_Script_With_Primary_Key]
--Go
/*
Creado por: Jorge Salvador Santos Neill
Fecha: 11 07 2018
Descripcion: es una funcion que recibe de parametro el nombre de una tabla y devuelve el script para su creacion.
*/
Create Function Get_Table_Script_With_Primary_Key
(
    @vsTableName varchar(50),
	@databaseName varchar(50),
	@schemeName varchar(50)
)

Returns
    VarChar(Max)
With ENCRYPTION

Begin

Declare @ScriptCommand varchar(Max)

Select @ScriptCommand =
    ' Create Table '+@databaseName+''+@schemeName+'[' + SO.name + '] (' + o.list + ')' 
    +
    (
        Case
        When TC.Constraint_Name IS NULL 
            Then ''
        Else 'ALTER TABLE ' + SO.Name + ' ADD CONSTRAINT ' +
            TC.Constraint_Name  + ' PRIMARY KEY ' + ' (' + LEFT(j.List, Len(j.List)-1) + ')'
        End
    )
From sysobjects As SO
    Cross Apply

    (
        Select 
            '  [' + column_name + '] ' + 
             data_type + 
             (
                Case data_type
                    When 'sql_variant' 
                        Then ''
                    When 'text' 
                        Then ''
                    When 'decimal' 
                        Then '(' + Cast( numeric_precision_radix As varchar ) + ', ' + Cast( numeric_scale As varchar ) + ') '
                    Else Coalesce( '(' + 
                                        Case 
                                            When character_maximum_length = -1 
                                                Then 'MAX'
                                            Else Cast( character_maximum_length As VarChar ) 
                                        End + ')' , ''
                                 ) 
                End 
            ) 
            + ' ' +
            (
                Case 
                    When Exists ( 
                                    Select id 
                                    From syscolumns
                                    Where 
                                        ( object_name(id) = SO.name )
                                        And 
                                        ( name = column_name )
                                        And 
                                        ( columnproperty(id,name,'IsIdentity') = 1 )
                                ) 
                        Then 'IDENTITY(' + 
                                Cast( ident_seed(SO.name) As varchar ) + ',' + 
                                Cast( ident_incr(SO.name) As varchar ) + ')'

                    Else ''

                End
            ) + ' ' +

            (
                Case 
                    When IS_NULLABLE = 'No' 
                        Then 'NOT ' 
                    Else '' 
                End 
            ) + 'NULL ' + 
            (
                Case 
                    When information_schema.columns.COLUMN_DEFAULT IS NOT NULL 
                        Then 'DEFAULT ' + information_schema.columns.COLUMN_DEFAULT 
                    ELse '' 
                End 
            ) + ', ' 
        From information_schema.columns 
        Where 
            ( table_name = SO.name )
        Order by ordinal_position
        FOR XML PATH('')) o (list)

        Inner Join information_schema.table_constraints As TC On (
                                                                    ( TC.Table_name = SO.Name )
                                                                    AND 
                                                                    ( TC.Constraint_Type  = 'PRIMARY KEY' )
                                                                    And 
                                                                    ( TC.TABLE_NAME = @vsTableName )
                                                                 )
        Cross Apply
            (
                Select '[' + Column_Name + '], '
                From  information_schema.key_column_usage As kcu
                Where 
                    ( kcu.Constraint_Name = TC.Constraint_Name )
                Order By ORDINAL_POSITION
                FOR XML PATH('')
            ) As j (list)
Where
    ( xtype = 'U' )
    AND 
    ( Name NOT IN ('dtproperties') )

Return @ScriptCommand

End
