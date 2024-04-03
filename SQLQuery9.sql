SELECT	N.Id, 
		N.IdChargeback AS Unique_Key, 
        N.RefNumber AS Reference_Number,
        N.EC AS EC, 
        N.isPartialCB AS CaracteristicaChargeback, 
        N.claimValue AS ValueTransaction, 
        N.Amount AS ValueChargeback,
		N.cbSendToMassa AS SendChargeback,
		S.descStatusCB AS Descricao_Status
FROM [dbo].[NewChargeBack] AS N 
INNER JOIN [dbo].[StatusChargeBack] AS S ON N.typeQueue = S.typeQueue;


EXEC sp_fkeys StatusChargeBack

ALTER TABLE NewChargeBack ADD CONSTRAINT FK_TypeQueue_Is_TypeQueueInSCB FOREIGN KEY (typeQueue)
			   REFERENCES dbo.StatusChargeBack (typeQueue) ON DELETE CASCADE ON UPDATE CASCADE





