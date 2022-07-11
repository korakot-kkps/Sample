select i.Account_Owner, ofc.Segment, c.ClientAUM,c.ClientRevenue,i.* 
from CIS.dbo.CIF_Client_Identitys i
	left join UFN_Util_GetOfficerInfo(null)  ofc on ofc.Login_Name = i.Account_Owner    
	inner join Test_Clients c on i.Client_ID = c.Client_ID 
where i.Open_Status = 'o' and i.Account_Owner not like 'ClosedAC%' and i.Account_Owner <> 'HouseID' and i.Account_Owner <> 'R'
	--and First_Name_T like '%หลักทรัพย์%'
	--and Last_Name_T = ''
	--and ofc.Segment = 'Equity'
	and isnull(c.ClientRevenue,0) > 100000 
	--and isnull(c.clientaum,0)  >= 30000000 
	--and i.Account_Owner = 'AttavKom'
	and i.Client_ID in (select poa.Client_ID
			from CIS.dbo.VWr_CIF_POA_Clients poa --from #temp --
				inner join CIS.dbo.CIF_Client_Identitys client on poa.Client_ID = client.Client_ID)
order by i.Account_Owner


select top 100 * from [dbo].[VW_pf_totport_all]

--where Account_Owner = 'acharpha'
SELECT * from  UFN_ClientInfo_CheckExistingClient( 'ชยิน', 'ฐิตะสัจจา', '', '' )
 
 select distinct account_owner  
from CIS.dbo.CIF_Client_Identitys
order by Account_Owner 

select  * from  Test_Clients where clientaum  < 30000000 and ClientRevenue < 100000 and Open_Status = 'o'  
select* from ShareholderBOD 

select AccountOwner,AccountOwnerFinal,* From VW_ProspectProfile where ProspectProfileId = 15603 

select * from ShareholderBOD share where ProspectProfileId = 15617
select * from UFN_Util_GetOfficerInfo('sarakkul')

select * From AccountOwnerReply where ProspectProfileId = 29230
select * From ProspectMatchingResult where ProspectProfileId = 29230
select * from Ref_WorkflowStage where LeadStage = 'closed' and IsActive = 1
select * From Ref_WorkflowAction
--(case when isnull(share.LastName,'') = '' then '' else share.FirstName end)

select exitingClient.* 
from (select * From ShareholderBOD ) share
     CROSS APPLY  ufn_util_getexistingclient (share.FirstName , share.LastName, (case when isnull(share.LastName,'') = '' then share.FirstName else '' end) ,'') exitingClient
where share.ProspectProfileId = 15617




