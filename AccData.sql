use GraRPG

DECLARE @RowCount INT
DECLARE @First VARCHAR(14)
DECLARE @Last VARCHAR(14)
Declare @Email VARCHAR(30)
DECLARE @RandomString NVARCHAR(MAX)
declare @int int

SET @RowCount = 1
While @RowCount < 10000
begin  
EXEC stringGenerator 10, @RandomString OUTPUT;
set @First = @RandomString;
SET @Last = REVERSE(@FIRST);
set @int = ABS(Checksum(NewID()) % 3) + 1
SET @Email = SUBSTRING(@First,1,4) + SUBSTRING(@Last,1,4) + '@' + 'host' +  CAST(CAST(@int as int) as varchar) + '.com'

    INSERT INTO [dbo].[Accounts]
           (ID, [Login]
           ,[Password]
           ,[Email]
           )
    VALUES  
        (NEXT VALUE FOR dbo.seq_acc ,@First, @Last, @Email)  
    SET @RowCount = @RowCount + 1 
END
