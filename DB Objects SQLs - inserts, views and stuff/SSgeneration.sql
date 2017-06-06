use GraRPG

DECLARE @Sword VARCHAR(30)
DECLARE @LSword Varchar(30)
DECLARE @Axe Varchar(30)
DECLARE @2Haxe Varchar(30)
DECLARE @Mace Varchar(30)
DECLARE @Bow Varchar(30)
DECLARE @Xbow Varchar(30)
DECLARE @Helmet Varchar(30)
DECLARE @Armor Varchar(30)
DECLARE @Boots Varchar(30)
DECLARE @Gloves Varchar(30)

DECLARE @RowCount2 INT
DECLARE @MOD INT
DECLARE @Buff varchar(20)

Declare @BUFFMOD int
Set @RowCount2 = 1
Set @MOD = 0


while @RowCount2 < 10
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Sword = 'Sword of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (1, @Sword)
set @RowCount2 = @RowCount2 + 1
end


while @RowCount2 < 20
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @LSword = 'Long Sword of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (2, @LSword)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 30
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Axe = 'Axe of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (3, @Axe)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 30
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @2Haxe = '2H Axe of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (4, @Axe)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 40
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Mace = 'Mace of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (5, @Mace)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 50
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Bow = 'Bow of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (6, @Bow)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 60
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Xbow= 'Crossbow of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (7, @Xbow)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 70
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Helmet = 'Helmet of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (8, @Helmet)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 80
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Armor = 'Armo of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (9, @Armor)
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 90
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Boots= 'Boots of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (10, @Boots)
set @RowCount2 = @RowCount2 + 1
end


while @RowCount2 < 100
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Gloves= 'Gloves of ' + @Buff + ' + '  + CAST(@BUFFMOD as nvarchar); 
insert into dbo.Item (ItemType, Name) VALUES (11, @Gloves)
set @RowCount2 = @RowCount2 + 1
end