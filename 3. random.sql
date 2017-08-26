-- step 1
use ComputerDB

-- step 2
CREATE VIEW seeder
AS
    SELECT RAND(CONVERT(VARBINARY, NEWID())) seed
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
END