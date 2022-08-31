-- DDL
create table tanks (SerialNumber varchar(8), StartDate datetime);
create table teardowns (id integer, EndDate datetime);

insert into tanks values 
('9999-001','2010/10/22 13:55:20'), 
('9999-002','2010/10/22 14:56:18'),
('9999-003','2010/10/22 15:56:18'),
('9999-004','2010/10/22 16:56:18'),
('9999-005','2010/10/22 17:56:18')
;

insert into teardowns values 
(16,'2010/10/22 12:56:19'), 
(17,'2010/10/22 13:57:30'),
(18,'2010/10/22 14:57:30'),
(19,'2010/10/22 15:57:30'),
(20,'2010/10/22 16:57:30')
;


-- query
select tanks.SerialNumber, tanks.StartDate as Wind_Start, teardowns.EndDate as LastTearDown 
from tanks, teardowns
where teardowns.EndDate = (select max(EndDate) from teardowns where EndDate <= StartDate)