--create database PortalMastercomChargeback;
--use PortalMastercomChargeback;

create table StatusChargeBack(
	IdStatusCb int primary key identity not null,
	DescStatusCB varchar(100) not null
);

--drop table StatusChargeBack;
select * from StatusChargeBack;
insert into [dbo].[StatusChargeBack] (DescStatusCB) values('Acquirer First CB Unworked'),
			  ('Acquirer RR Unworked'),
			  ('Processed'),
			  ('Acquirer Arbitration CB Unworked'),
			  ('Fee Collection Unworked'),
			  ('Closed');



select Id as Identificação,
	   IdChargeback as UniqueKey,
	   RefNumber as NumeroReferencia,
	   EC as EstabelecimentoComercial,
	   typeQueue as StatusChargeback,
	   isPartialCB as CaracteristicaChargeback,
	   claimValue as ValorTransacao,
	   Amount as ValorChargeback,
	   cbSendToMassa as ChargebackEnviadoParaMassa
from NewChargeBack;

truncate table NewChargeBack;

select count(RefNumber) from NewChargeBack where RefNumber = RefNumber;
select * from NewChargeBack;
truncate table NewChargeBack;

drop table NewChargeBack;
--insert into NewChargeBack (RefNumber,EC,typeQueue,isPartialCB,claimValue,Amount,cbSendToMassa) 
--	   values('12345678987456123459875','','','','','','');