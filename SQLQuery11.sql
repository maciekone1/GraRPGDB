CREATE PROCEDURE [dbo].[RandomString]
  @sLength tinyint = 10,
  @randomString varchar(20) OUTPUT
AS
BEGIN
  SET NOCOUNT ON
  DECLARE @counter tinyint
  DECLARE @nextChar char(1)
  SET @counter = 1
  SET @randomString = ''

  WHILE @counter <= @sLength
    BEGIN
      SELECT @nextChar = CHAR(ROUND(RAND() * 93 + 33, 0))
      IF ASCII(@nextChar) not in (34, 39, 40, 41, 44, 46, 96, 58, 59)
        BEGIN
          SELECT @randomString = @randomString + @nextChar
          SET @counter = @counter + 1
        END
    END
END