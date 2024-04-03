USE [PortalMastercomChargeback]
GO

/****** Object:  Table [dbo].[NewChargeBack]    Script Date: 06/12/2019 12:06:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[NewChargeBack]
CREATE TABLE [dbo].[NewChargeBack](
    [Id] [int] IDENTITY NOT NULL,
	[cardNumber][varchar](19) NOT NULL,
	[IdChargeback] [varchar](255) NOT NULL,
	[RefNumber] [varchar](23) NOT NULL,
	[EC] [varchar](10) NOT NULL,
	[typeQueue] [int] NOT NULL,
	[isPartialCB] [varchar] NOT NULL,
	[claimValue] [decimal](12, 2) NULL,
	[Amount] [decimal](12, 2) NULL,
	[cbSendToMassa] [char](1) NOT NULL,
 CONSTRAINT [typeQueue] PRIMARY KEY CLUSTERED 
(
	[IdChargeback] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SELECT * FROM [dbo].[StatusChargeBack];
SELECT * FROM [dbo].[NewChargeBack];
TRUNCATE TABLE [dbo].[NewChargeBack];

SELECT * FROM [dbo].[NewChargeBack] ORDER BY [Id] ASC;

SELECT TOP 1 IdChargeback FROM [dbo].[NewChargeBack] ORDER BY Id DESC

--para alterar o nome da coluna em uma tabela
EXEC sp_rename '[dbo].[StatusChargeBack].[IdStatusCb]','[typeQueue]','COLUMN';
EXEC sp_rename '[dbo].[StatusChargeBack].[typeQueue]','[typeQueue]','COLUMN';

DROP TABLE StatusChargeBack;

CREATE TABLE StatusChargeBack(
	typeQueue int primary key identity  not null,
	descStatusCB varchar(100) not null
 );

 INSERT INTO StatusChargeBack ( descStatusCB) 
        values	('Acquirer First CB Unworked'),
				('Acquirer RR Unworked'),
				('Processed'),
				('Acquirer Arbitration CB Unworked'),
				('Fee Collection Unworked'),
				('Closed');

SELECT  N.cardNumber AS Card_Number,
		N.IdChargeback AS Unique_Key, 
        N.RefNumber AS Reference_Number,
        N.EC AS EC, 
        N.typeQueue AS typeQueue,
        N.isPartialCB AS Caracteristica_Chargeback, 
        N.claimValue AS ValueTransaction, 
		N.Amount AS ValueChargeback,
        N.cbSendToMassa AS SendChargeback,
		StatusChargeBack.descStatusCB AS Descricao
FROM [dbo].[NewChargeBack] AS N 
INNER JOIN [dbo].[StatusChargeBack] ON N.typeQueue = [dbo].[StatusChargeBack].typeQueue
ORDER BY N.Id OFFSET $inicio ROWS FETCH NEXT $quantidade ROWS ONLY

insert into NewChargeBack (cardNumber, IdChargeback, RefNumber, EC, typeQueue, isPartialCB, claimValue, Amount, cbSendToMassa) 
values (4,1236547891123654789198,1234567890,1,0, '200','200',1);

SELECT * FROM [dbo].[StatusChargeBack];

SELECT * FROM [dbo].[NewChargeBack] ORDER BY Id ASC;

TRUNCATE TABLE [dbo].[NewChargeBack];

EXEC sp_fkeys StatusChargeBack
EXEC sp_fkeys NewChargeBack

ALTER TABLE NewChargeBack ADD CONSTRAINT FK_TypeQueue_Is_TypeQueueInSCB FOREIGN KEY (typeQueue)
			   REFERENCES dbo.StatusChargeBack (typeQueue) ON DELETE CASCADE ON UPDATE CASCADE


SELECT	N.Id,
               N.cardNumber,
		       N.IdChargeback, 
               N.RefNumber,
               N.typeQueue,
               N.EC, 
               N.isPartialCB, 
               N.claimValue, 
               N.Amount,
		         N.cbSendToMassa,
		         S.descStatusCB
      FROM [dbo].[NewChargeBack] AS N 
      INNER JOIN [dbo].[StatusChargeBack] AS S 
      ON N.typeQueue = S.typeQueue
      WHERE Id = 4
      ORDER BY N.Id;


UPDATE NewChargeBack SET 
		cardNumber ='0', 
		RefNumber='0',
		IdChargeback ='0',
        EC='0',     
        typeQueue='0',
        isPartialCB='0',
        claimValue='0',
        Amount='0',
        cbSendToMassa='' where Id = 4

CREATE TABLE CaracteristicaChargeBack(
	IdCarCharge int primary key not null,
	descCaractCB varchar(100) not null
 );

DROP TABLE CaracteristicaChargeBack;

INSERT INTO CaracteristicaChargeBack (IdCarCharge, descCaractCB) 
        values	(0,'Chargeback Total'),
				(1,'Chargeback Parcial');

SELECT * FROM [dbo].[CaracteristicaChargeBack];

SELECT 
         N.Id AS Id,
         N.cardNumber AS Card_Number,
         N.IdChargeback AS Unique_Key, 
         N.RefNumber AS Reference_Number,
         N.EC AS EC, 
         N.typeQueue AS typeQueue,
		 CaracteristicaChargeBack.descCaractCB AS Descricao_CaracteristicaCB,
         N.claimValue AS ValueTransaction, 
         N.Amount AS ValueChargeback,
         N.cbSendToMassa AS SendChargeback,
         StatusChargeBack.descStatusCB AS Descricao
            FROM [dbo].[NewChargeBack] AS N 
            INNER JOIN [dbo].[StatusChargeBack] ON N.typeQueue = [dbo].[StatusChargeBack].typeQueue
			INNER JOIN [dbo].[CaracteristicaChargeBack] ON N.isPartialCB = [dbo].[CaracteristicaChargeBack].IdCarCharge
            ORDER BY N.Id;

SELECT * FROM [dbo].[NewChargeBack] ORDER BY Id ASC;
SELECT * FROM [dbo].[CaracteristicaChargeBack] ORDER BY [IdCarCharge] ASC;
SELECT * FROM [dbo].[StatusChargeBack] ORDER BY [typeQueue] ASC;

TRUNCATE TABLE [dbo].[NewChargeBack];
UPDATE [dbo].[NewChargeBack] SET [cbSendToMassa] = 1 WHERE Id> 0;
SELECT * FROM [dbo].[NewChargeBack] ORDER BY Id ASC;

DELETE FROM [dbo].[NewChargeBack] WHERE Id = 1;