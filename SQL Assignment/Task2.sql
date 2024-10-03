-- 1. List all the customers 

select * from Users;

-- 2. List all orders for a specific customer 

select * from Couriers where SenderName = 'Ravi Sharma';

-- 3. List all couriers 

select * from Couriers;

-- 4. List all packages for a specific order 

select * from Couriers where CourierID = 2;

-- 5. List all deliveries for a specific courier 

select * from Couriers where CourierID = 1;

-- 6. List all undelivered packages 

select * from Couriers where Status != 'Delivered';

-- 7. List all packages that are scheduled for delivery today 

select * from Couriers where DeliveryDate = GETDATE();

-- 8. List all packages with a specific status 

select * from Couriers where Status = 'Delivered';

-- 9. Calculate the total number of packages for each courier 

select SenderName, count(*) as TotalPackages from Couriers group by SenderName;

-- 10. Find the average delivery time for each courier
-
-- There is no sent date column in Couriers table, so I altered the Couriers table and added SentDate Column

alter table Couriers add SentDate Date;

select SenderName, AVG(DATEDIFF(DAY,SentDate,DeliveryDate)) as AvgDeliveryTime from Couriers group by SenderName;

-- 11. List all packages with a specific weight range

select * from Couriers where Weight between 5.0 and 10.0;

-- 12. Retrieve employees whose names contain 'John' 

select * from Employees where Name like ('%John%');


-- 13. Retrieve all courier records with payments greater than 500

select *,p.Amount from Couriers c 
join Payment p on c.CourierID = p.CourierID
where p.Amount > 500;










