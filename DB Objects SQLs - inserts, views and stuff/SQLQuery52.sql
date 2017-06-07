
select* from dbo.AccountCharacters


select count(*), AccountID from dbo.AccountCharacters 
group by AccountID
order by AccountID;