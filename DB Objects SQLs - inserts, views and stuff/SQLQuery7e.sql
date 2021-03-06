USE [GraRPG]
GO
/****** Object:  StoredProcedure [dbo].[logOut]    Script Date: 06.06.2017 18:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[logOut]
@characterID int,
@X int,
@Y int,
@nazwa nvarchar(30)
AS
BEGIN
update dbo.Character set Logged = 0 where ID = @characterID
update dbo.Localization set X = @X, Y = @Y, Nazwa = @nazwa where ID = (select dbo.Character.CharLocID from dbo.Character where dbo.Character.ID = @characterID);
end
