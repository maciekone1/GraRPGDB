alter function dbo.Hosting (@email nvarchar(255)) Returns varchar(255)
as Begin
declare @EmailB nvarchar(255)
set @EmailB = @email

set @EmailB = REPLACE(SUBSTRING(@EmailB, CHARINDEX('.', @EmailB), LEN(@EmailB)), '.', '.')

return @EmailB
end