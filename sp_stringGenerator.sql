USE [GraRPG]
GO
/****** Object:  StoredProcedure [dbo].[stringGenerator]    Script Date: 01.06.2017 09:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[stringGenerator]
@sLength tinyint , 
@RandomString nvarchar(MAX) OUTPUT 
 
AS
 
SET NOCOUNT ON
 
DECLARE @Count tinyint, @NextC char(1)
SET @Count = 1
SET @RandomString = ''
WHILE @Count <= @sLength
BEGIN
SELECT @NextC = CHAR(ROUND(RAND() * 81 + 33, 0))
	IF (ASCII(@NextC) > 96  AND ASCII(@NextC) < 122) or (ASCII(@NextC) > 65  AND ASCII(@NextC) < 90)
		BEGIN
			SELECT @RandomString = @RandomString + @NextC
			SET @Count = @Count + 1
		END
	END
 
