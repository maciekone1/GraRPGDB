create function dbo.emailSep (@email nvarchar(255))
Returns varchar(255)
as Begin

declare @EmailB nvarchar(255)
set @EmailB = @email;
set @EmailB = REPLACE(@EmailB, '@', '')
set @EmailB = REPLACE(@EmailB, '.host', '')
set @EmailB = REPLACE(@EmailB, '.com', '')

return @EmailB
end