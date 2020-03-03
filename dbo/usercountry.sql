
CREATE PROCEDURE [dbo].[usercountry]
	-- Add the parameters for the stored procedure here
 @country varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select Id,
FirstName,
LastName,
City,
Country,
Phone  from customer where country = @country
 
END
GO
