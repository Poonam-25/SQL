Create Database CaseStudy

Create Table Event(EventID int Primary Key, Duration int, 
[Status Code] Varchar(max), [Reson code] Varchar(max))
Insert into Event values (1,5,'R','S')
Insert into Event values (2,60,'D1','S')
Insert into Event values (3,10,'S','C')
Insert into Event values (4,20,'D2','H')
Insert into Event values (5,15,'S','H')
Insert into Event values (6,25,'D1','V')
Insert into Event values (7,20,'R','S')
Insert into Event values (8,60,'D2','B')
Select*from Event

Create Table Status([Status Code] Varchar(max),[Status Name] Varchar(max))
Insert into Status values ('R','Ready'),('D1','Delay'),('S','Spare'),
('D2','Down')
Select*from Status

Create Table ReadyReason([Reason Code] Varchar(max),[Reason Name]         Varchar(max))
Insert into ReadyReason values ('S','Standby'),('R','Running')
Select*from ReadyReason

Create Table DelayReason([Reason Code] Varchar(max),[Reason Name] Varchar(max))
Insert into DelayReason values ('S','NO Sapre'),('V','Vendor')
Select*from DelayReason

Create Table SpareReason([Reason Code] Varchar(max),[Reason Name] Varchar(max))
Insert into SpareReason values ('C','Cold Sapre'),('H','Hot Spare')
Select*from SpareReason

Create Table DownReason([Reason Code] Varchar(max),[Reason Name] Varchar(max))
Insert into DownReason values ('B','Broken Part'),('H','Over Heated')
Select*from DownReason

Select Event.EventID, Event.Duration , Status.[Status Name] from Event
Inner join Status 
On Event.[Status Code]=Status.[Status Code]

Select 'R' as [Status Code] ,[Reason Code],[Reason Name] From ReadyReason 
Union
Select 'D1',[Reason Code], [Reason Name] From DelayReason
Union
Select 'S', [Reason Code],[Reason Name] From SpareReason
Union
Select 'D2', [Reason Code],[Reason Name] From DownReason

--Final Code--
Select Event.EventID, Event.Duration , SR.[Reason Name] ,Status.[Status Name] From  Event
Inner join 
(
Select 'R' as [Status Code] ,[Reason Code],[Reason Name] From ReadyReason 
Union
Select 'D1',[Reason Code], [Reason Name] From DelayReason
Union
Select 'S', [Reason Code],[Reason Name] From SpareReason
Union
Select 'D2', [Reason Code],[Reason Name] From DownReason
)SR
On Event.[Status Code]=SR.[Status Code]
And Event.[Reson code]=SR.[Reason Code]
inner join Status
On Event.[Status Code]=Status.[Status Code]


