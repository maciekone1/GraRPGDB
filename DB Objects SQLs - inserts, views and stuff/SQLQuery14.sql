select Login, Email, dbo.emailSep (dbo.Accounts.Email) from dbo.Accounts;

select Login, Email, dbo.Hosting (dbo.Accounts.Email) from dbo.Accounts;

select * from dbo.v_account_chars


update dbo.Character set Alive = 1;