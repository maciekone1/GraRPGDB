use GraRPG

DECLARE @RowCount INT
DECLARE @RowString VARCHAR(14)
DECLARE @First VARCHAR(14)
DECLARE @Last VARCHAR(14)
Declare @Email VARCHAR(20)
DECLARE @RandomString NVARCHAR(MAX)
SET @RowCount = 1
While @RowCount < 3
begin  
EXEC stringGenerator 10, @RandomString OUTPUT;

set @First = @RandomString;
SET @Last = REVERSE(@FIRST);
SET @Email = @First + '@' + @Last  + '.host.com' 
        INSERT INTO [dbo].[Accounts]
           ([Login]
           ,[Password]
           ,[Email]
           )
    VALUES  
        (@First, @Last, @Email)  
    SET @RowCount = @RowCount + 1 
END
