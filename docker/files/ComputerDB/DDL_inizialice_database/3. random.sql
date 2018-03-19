-- step 1
USE [ComputerDB];
GO

/****** Object:  View [dbo].[seeder]    Script Date: 08/02/2018 7:12:10 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[seeder]
AS
    SELECT RAND(CONVERT(VARBINARY, NEWID())) seed

GO



-- step 3
USE [ComputerDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getRandomDate]    Script Date: 08/02/2018 7:11:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- step 3
CREATE FUNCTION [dbo].[getRandomDate]
(
	@lower DATE,
	@upper DATE
)
RETURNS DATE
AS
BEGIN
	DECLARE @random DATE
	SELECT @random = DATEADD(day, DATEDIFF(DAY, @lower, @upper) * seed, @lower) FROM dbo.seeder
	RETURN @random
END;