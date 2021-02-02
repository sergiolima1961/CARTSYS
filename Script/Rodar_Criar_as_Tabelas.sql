INSERT INTO [dbo].[USUARIO]
           ([NOME]
           ,[LOGIN]
           ,[SENHA]
           ,[STATUS])  
 SELECT 'SERGIO LIMA','SLIMA','1234',1
 union 
 SELECT 'CARTSYS','CSYS','1234',1