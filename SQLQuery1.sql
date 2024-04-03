/****** Script do comando SelectTopNRows de SSMS  ******/
SELECT TOP (1000) [ID]
      ,[PARENT_ID]
      ,[Codigo_Transacao]
      ,[Codigo_Registro]
      ,[Numero_de_referencia_da_transacao]
      ,[Resgistro_00]
      ,[Cod_moeda]
      ,[Valor_venda_saque_chargeback]
      ,[NumeroEC]
      ,[Numero_logico_do_equipamento]
      ,[NSU]
      ,[Cod_Autorizacao]
  FROM [Datapool_Elo].[dbo].[TRANS_TCR00]

  alter table [dbo].[TRANS_TCR00] add TipoLiquidacao varchar(1) null;

  select * from [dbo].[TRANS_TCR00];