/****** Script do comando SelectTopNRows de SSMS  ******/
SELECT  [ID]
      ,[PARENT_ID]
      ,[AcquirerReferenceNumber]
      ,[Trans_XX]
      ,[TransactionAmount]
      ,[CardAcceptorIDCode]
      ,[Pan]
      ,[NSU]
      ,[CardAcceptorTerminalID]
      ,[CodAutorizacao]
  FROM [Datapool_Master].[dbo].[TRANS_TCR]

 -- SELECT * FROM [dbo].[TRANS_TCR]
  --TRUNCATE TABLE [dbo].[FileConvertedByte]