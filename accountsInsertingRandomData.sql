use GraRPG

DECLARE @RowCount INT
DECLARE @First VARCHAR(14)
DECLARE @Last VARCHAR(14)
Declare @Email VARCHAR(30)
DECLARE @RandomString NVARCHAR(MAX)

SET @RowCount = 1
While @RowCount < 1
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

/*
-------------
use GraRPG

DECLARE @Sword VARCHAR(30)
DECLARE @RowCount2 INT
DECLARE @MOD INT
DECLARE @Buff varchar(20)

Set @RowCount2 = 1
Set @MOD = 0


while @RowCount2 < 10
begin
exec stringGenerator 4, @Buff OUTPUT;

SET @Sword = 'Sword of ' + @Buff + ' + ' + Cast(RAND()*(11-1)+0 as int);; 
insert into dbo.Item (ItemType, Name) VALUES (1, @Sword)
set @RowCount2 = @RowCount2 + 1
end
--------------


use GraRPG

insert into dbo.ItemType (Description, Typ) Values ('Miecz ostry krótki', 'Miecz krótki'), ('Miecz ostry d³ugi' , 'Miecz d³ugi'),('Topór ostry' , 'Topór'),('Topór ostry dwórêczny' , 'Topór dwórêczny'),('Ciê¿ka bu³awa', 'Bulawa'),('Uk zwany ³ukiem', '£ók'), ('Kusza co be³tami strzela', 'Kusza'), ('He³m chroni g³owe', 'He³m'), ('Zbroja - chroni klate', 'Zbroja'), ('Cichobiegi', 'Buty'), ('Rêkawice - do wyjmowania ciasta', 'Rêkawice')
*/