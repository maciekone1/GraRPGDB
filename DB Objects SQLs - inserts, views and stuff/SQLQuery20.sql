ALTER view mv_account_chars_dead with SCHEMABINDING as  
	select a.Login, a.Email as [E-mail], ch.Name as [Nazwa Postaci], ch.Level, ch.Logged as [Zalogowana], cs.Class_name as [Klasa] , sp.Name  as Specjalizacja, lo.Nazwa as Lokalizacja
	 from dbo.Accounts as a 
	inner join dbo.AccountCharacters ac on a.ID = ac.AccountID 
	join dbo.Character ch on ac.CharacterID = ch.ID 
	join dbo.Class cs on ch.ClasssID = cs.ID
	join dbo.Specialisation sp on cs.SpecialisationID = sp.ID
	join dbo.Localization lo on lo.ID = ch.CharLocID
	where ch.Alive = 0
