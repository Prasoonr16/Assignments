-- Task 4: Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join
====================================================================================

-- 23. Retrieve Payments with Courier Information

select p.PaymentID, p.Amount, p.PaymentDate, c.CourierID, c.SenderName, c.SenderAddress, c.ReceiverName, 
c.ReceiverAddress, c.Weight, c.TrackingNumber, c.Status
from Payment p
join Couriers c 
on p.CourierID = c.CourierID;

-- 24. Retrieve Payments with Location Information

select p.PaymentID, p.Amount, p.PaymentDate, l.LocationID, l.LocationName, l.Address
from Payment p
join Location l 
on p.LocationID = l.LocationID;

-- 25. Retrieve Payments with Courier and Location Information 

select p.PaymentID, p.Amount, p.PaymentDate, c.CourierID, c.SenderName, c.SenderAddress, c.ReceiverName, 
c.ReceiverAddress, c.Weight, c.TrackingNumber, c.Status, l.LocationID, l.LocationName, l.Address
from Payment p
join Couriers c 
on p.CourierID = c.CourierID
join Location l
on p.LocationID = l.LocationID;

-- 26. List all payments with courier details 

select p.PaymentID, p.Amount, p.PaymentDate, 
c.CourierID, c.SenderName, c.ReceiverName, c.Weight, c.TrackingNumber, c.Status
from Payment p
join Couriers c on p.CourierID = c.CourierID;

-- 27. Total payments received for each courier

select c.CourierID, c.SenderName, c.ReceiverName, SUM(p.Amount) as TotalPayments
from Couriers c
join Payment p on c.CourierID = p.CourierID
group by c.CourierID, c.SenderName, c.ReceiverName;

-- 28. List payments made on a specific date

select * from Payment 
where PaymentDate = '2024-09-20';

-- 29. Get Courier Information for Each Payment

select p.PaymentID, P.Amount, P.PaymentDate, c.CourierID,c.SenderName, c.SenderAddress, c.ReceiverName, 
c.ReceiverAddress, c.Weight, c.TrackingNumber, c.Status
from Payment p
join Couriers c 
on p.CourierID = c.CourierID;

-- 30. Get Payment Details with Location

select p.PaymentID, p.CourierID, p.LocationID, p.Amount, p.PaymentDate, l.LocationID, l.LocationName, l.Address
from Payment p
join Location l
on p.LocationID = l.LocationID;

-- 31. Calculating Total Payments for Each Courier

select c.CourierID, c.SenderName, c.ReceiverName, SUM(p.Amount) as TotalPayments
from Couriers c
join Payment p ON c.CourierID = p.CourierID
group by c.CourierID, c.SenderName, c.ReceiverName;

-- 32. List Payments Within a Date Range 

select * from Payment
where PaymentDate between '2024-09-10' and '2024-09-20';

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are 
--     no matches on either side

alter table Users
add CourierID int

alter table Users
add constraint FK_User_Courier
foreign key (CourierID) references Couriers(CourierID);

select u.UserID, u.Name, u.Email, u.ContactNumber, c.CourierID,c.SenderName, c.SenderAddress, 
c.ReceiverName, c.ReceiverAddress, c.Weight, c.TrackingNumber, c.Status, c.DeliveryDate
from Users u
full outer join Couriers c
on u.CourierID = c.CourierID
order by u.UserID, c.CourierID;

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no 
--     matches on either side

alter table Couriers
add ServiceId int;

alter table Couriers
add constraint FK_Courier_Service
foreign key (ServiceID) references CourierServices(ServiceID);

select c.CourierID, c.SenderName, c.ReceiverName, c.Weight, cs.ServiceID, cs.ServiceName, cs.Cost
from Couriers c
full outer join CourierServices cs on c.ServiceID = cs.ServiceID;  

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are 
--     no matches on either side 

alter table Payment
add EmployeeID;

alter table Payment
add constraint FK_Payment_Employee
foreign key (EmployeeID) references Employees(EmployeeID);


select e.EmployeeID, e.Name, e.Email, e.ContactNumber, e.Role, p.PaymentID, p.Amount, p.PaymentDate, 
p.LocationID
from Employees e
full outer join Payment p ON e.EmployeeID = p.EmployeeID;

-- 36. List all users and all courier services, showing all possible combinations.

select u.UserID, u.Name, u.Email, cs.ServiceID, cs.ServiceName, cs.Cost
from Users u
cross join CourierServices cs;

-- 37. List all employees and all locations, showing all possible combinations.

select e.EmployeeID, e.Name, e.Email, e.ContactNumber, e.Role, e.Salary, l.LocationID, l.LocationName, l.Address
from Employees e
cross join Location l;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available)

select CourierID, SenderName, SenderAddress, Weight, Status, TrackingNumber,SentDate, DeliveryDate from Couriers;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available)

select CourierID, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate from Couriers;

-- 40. Retrieve a list of couriers along with the courier service details (if available)

select c.CourierID, c.SenderName, c.SenderAddress, c.ReceiverName, c.ReceiverAddress, c.TrackingNumber, 
c.DeliveryDate, cs.ServiceID, cs.ServiceName,cs.Cost
from Couriers c
left join CourierServices cs on c.ServiceID = cs.ServiceID;


-- 41. Retrieve a list of employees and the number of couriers assigned to each employee

alter table Couriers
add EmployeeID;

alter table Couriers
add constraint FK_Courier_Employee
foreign key (EmployeeID) references Employees(EmployeeID);

select e.EmployeeID, e.Name, e.Email, e.Role, COUNT(c.CourierID) as NumberOfCouriersAssigned
from Employees e
left join Couriers c ON e.EmployeeID = c.EmployeeID  
group by e.EmployeeID, e.Name, e.Email, e.Role;

-- 42. Retrieve a list of locations and the total payment amount received at each location

select l.LocationID, l.LocationName, sum(p.Amount) as TotalPaymentReceived
from Location l
join Payment p on l.LocationID = p.LocationID
group by l.LocationID, l.LocationName;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName)

select c1.CourierID, c1.SenderName, c1.SenderAddress, c1.ReceiverName, c1.ReceiverAddress, c1.Weight, c1.Status, 
c1.TrackingNumber, c1.DeliveryDate
from Couriers c1
join Couriers c2 on c1.SenderName = c2.SenderName
and c1.CourierID != c2.CourierID  

-- 44. List all employees who share the same role

select e.Role, e.EmployeeID, e.Name, e.Email, e.ContactNumber
from Employees e
JOIN (select Role from Employees group by Role having COUNT(EmployeeID) > 1)  
SharedRoles on e.Role = SharedRoles.Role
order by e.Role, e.EmployeeID;

-- 45. Retrieve all payments made for couriers sent from the same location.

select p.PaymentID, p.Amount, p.PaymentDate,c.CourierID, c.SenderName, c.SenderAddress, l.LocationID, l.LocationName
from Payment p
join Couriers c on p.CourierID = c.CourierID  
join Location l on c.SenderAddress = l.Address  
order by l.LocationID;	


-- 46. Retrieve all couriers sent from the same location (based on SenderAddress)

select c.CourierID, c.SenderName, c.SenderAddress, c.ReceiverName, c.ReceiverAddress, c.Weight, c.Status, 
c.TrackingNumber, c.DeliveryDate
from Couriers c
where c.SenderAddress in (select SenderAddress from Couriers group by SenderAddress having COUNT(CourierID) > 1 )
order by c.SenderAddress;

-- 47. List employees and the number of couriers they have delivered

select e.EmployeeID, e.Name as EmployeeName, COUNT(c.CourierID) as NumberOfCouriersDelivered
from Employees E
left join Couriers c on e.EmployeeID = c.EmployeeID  
where c.Status = 'Delivered'  
group by e.EmployeeID, e.Name;

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services

select c.CourierID, c.SenderName, c.ReceiverName, c.Weight, c.Status, c.TrackingNumber, c.DeliveryDate, 
p.Amount as PaymentAmount, s.Cost as ServiceCost
from Couriers C
join Payment p on c.CourierID = p.CourierID  
join CourierServices s ON c.ServiceID = s.ServiceID  
WHERE p.Amount > s.Cost;  

-- Scope: Inner Queries, Non Equi Joins, Equi joins,Exist,Any,All
==================================================================

-- 49. Find couriers that have a weight greater than the average weight of all couriers

select c.CourierID, c.SenderName, c.SenderAddress, c.ReceiverName, c.ReceiverAddress, c.Weight, c.Status, 
c.TrackingNumber, c.DeliveryDate
from Couriers c
where c.Weight > (select AVG(Weight) from Couriers);

-- 50. Find the names of all employees who have a salary greater than the average salary

select e.EmployeeID, e.Name, e.Salary
from Employees e
where e.Salary > (select AVG(Salary) from Employees);

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost

select SUM(cs.Cost) as TotalCost
from CourierServices cs
where cs.Cost < (select MAX(Cost) from CourierServices);

-- 52. Find all couriers that have been paid for

select c.CourierID, c.SenderName, c.ReceiverName, c.Weight, c.Status, c.TrackingNumber, c.DeliveryDate
from Couriers c
join Payment p on c.CourierID = p.CourierID  
order by c.CourierID;

-- 53. Find the locations where the maximum payment amount was made

select l.LocationID, l.LocationName, l.Address, p.Amount as PaymentAmount
from Location l
join Payment p ON l.LocationID = p.LocationId  
where p.Amount = (select MAX(Amount) from Payment)
order by l.LocationID;

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender 

select c1.CourierID, c1.SenderName, c1.ReceiverName, c1.Weight, c1.Status, c1.TrackingNumber, c1.DeliveryDate
from Couriers c1
where c1.Weight > (select MAX(c2.Weight) from Couriers c2 where SenderName = 'Ravi Sharma')
order by c1.Weight desc;
