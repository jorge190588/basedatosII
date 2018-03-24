use ComputerDB

declare @characterNumberInRight int
declare @oldCharacterOnRightSide varchar(10)
declare @newCharacterOnRightSide varchar(10)
declare @id varchar(10), @name varchar(50), @tableName varchar(50), @newName varchar(50)
select @oldCharacterOnRightSide='07',@newCharacterOnRightSide='18'
select @characterNumberInRight=len(@oldCharacterOnRightSide)

declare curEjemplo cursor for
SELECT  TABLE_NAME tableName , 
		RIGHT(TABLE_NAME,@characterNumberInRight) id,
		LEFT(TABLE_NAME,LEN(table_name)-@characterNumberInRight) name
FROM INFORMATION_SCHEMA.TABLES
WHERE RIGHT(TABLE_NAME,@characterNumberInRight)=@oldCharacterOnRightSide

open curEjemplo
fetch next from curEjemplo
into @tableName,@id,@name
while @@fetch_status = 0
begin
	select @newName =CONVERT(varchar(50),@name)+@newCharacterOnRightSide
	select @tableName= 'dbo.'+@tableName
	exec sp_rename @tableName,@newName
	--select 'dbo.'+convert(varchar(50),@tableName), CONVERT(varchar(50),@name)+'18'
fetch next from curEjemplo
into @tableName,@id,@name
end

--cerrar cursor
close curEjemplo
deallocate curEjemplo
