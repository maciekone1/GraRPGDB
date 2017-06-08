create procedure sp_czary
as

DECLARE @Mag VARCHAR(30)
DECLARE @Druid Varchar(30)
DECLARE @Czarnoksieznik Varchar(30)
DECLARE @Paladyn Varchar(30)
DECLARE @Warrior Varchar(30)
DECLARE @Thief Varchar(30)
DECLARE @Kleryk Varchar(30)
DECLARE @Bard Varchar(30)
Declare @Description varchar(30)
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
SET @Mag = 'Mage spell of ' + @Buff;
SET @Description = @MAG +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Mag, @Description, 1);
set @RowCount2 = @RowCount2 + 1
end
while @RowCount2 < 20
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Druid = 'Druid spell of ' + @Buff;
SET @Description = @Druid +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Druid, @Description, 2);
set @RowCount2 = @RowCount2 + 1
end
while @RowCount2 < 30
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Czarnoksieznik = 'Warlock spell of ' + @Buff;
SET @Description = @Czarnoksieznik +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Czarnoksieznik, @Description, 3);
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 40
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Paladyn = 'Paladin spell of ' + @Buff;
SET @Description = @Paladyn +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Paladyn, @Description, 4);
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 50
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Warrior = 'Warropr spell of ' + @Buff;
SET @Description = @Warrior +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Warrior, @Description, 5);
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 60
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Thief = 'Thief spell of ' + @Buff;
SET @Description = @Thief +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Thief, @Description, 6);
set @RowCount2 = @RowCount2 + 1
end

while @RowCount2 < 70
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Kleryk = 'Cleric spell of ' + @Buff;
SET @Description = @Kleryk +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Kleryk, @Description, 7);
set @RowCount2 = @RowCount2 + 1
end


while @RowCount2 < 80
begin
exec stringGenerator 4, @Buff OUTPUT;
set @BUFFMOD = Cast(RAND()*(11-1)+1 as int)
SET @Bard = 'Bard spell of ' + @Buff;
SET @Description = @Bard +  ' + '  + CAST(@BUFFMOD as nvarchar) + 'DMG';
insert into dbo.Spells (Name, Description, ClassID) VALUES (@Bard, @Description, 8);
set @RowCount2 = @RowCount2 + 1
end






