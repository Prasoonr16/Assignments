-- creating database --

create database CourierManagementSystem;

-- using database --

use CourierMagagementSystem;

-- creating Users table --

create table Users
(UserID INT PRIMARY KEY,
Name VARCHAR(20),
Email VARCHAR(20) UNIQUE,
Password VARCHAR(20),
ContactNumber VARCHAR(12),
Address TEXT);

-- creating Couries table --

create table Couriers
(CourierID INT PRIMARY KEY,
SenderName VARCHAR(20),
SenderAddress TEXT,
ReceiverName VARCHAR(20),
ReceiverAddress TEXT,
Weight DECIMAL(5,2),
Status VARCHAR(20),
TrackingNumber VARCHAR(20) UNIQUE,
DeliveryDate DATE);

-- creating CourierServices table --

create table CourierServices 
(ServiceID INT PRIMARY KEY, 
ServiceName VARCHAR(50), 
Cost DECIMAL(8, 2));

-- creating Employees table --

create table Employees
(EmployeeID INT PRIMARY KEY, 
Name VARCHAR(20),
Email VARCHAR(30) UNIQUE, 
ContactNumber VARCHAR(12), 
Role VARCHAR(20), 
Salary DECIMAL(10, 2));

-- creating Location table --

create table Location
(LocationID INT PRIMARY KEY, 
LocationName VARCHAR(50), 
Address TEXT); 

-- creating Payment table --

create table Payment
(PaymentID INT PRIMARY KEY, 
CourierID int, 
LocationId int, 
Amount DECIMAL(10, 2), 
PaymentDate DATE, 
FOREIGN KEY (CourierID) REFERENCES Couriers(CourierID), 
FOREIGN KEY (LocationID) REFERENCES Location(LocationID));

-- inserting data into users table --

insert into Users
values 
(1, 'Ravi Sharma', 'ravi.sharma@gmail.com', 'password123', '+919876543210', '123 MG Road, Indore, Madhya Pradesh'),
(2, 'Priya Verma', 'priya.verma@gmail.com', 'securepass456', '+919865432198', '456 Link Road, Pune, Maharashtra'),
(3, 'Amit Patel', 'amit.patel@gmail.com', 'amitPass789', '+919912345678', '789 CG Road, Ahmedabad, Gujarat'),
(4, 'Neha Kapoor', 'neha.kapoor@gmail.com', 'nehaSecret321', '+919876543211', '234 Rajpath, New Delhi, Delhi'),
(5, 'Rahul Gupta', 'rahul.gupta@gmail.com', 'rahulPass543', '+919934567890', '567 Anna Nagar, Chennai, Tamil Nadu'),
(6, 'Sumit Reddy', 'sumit.reddy@gmail.com', 'sumre89', '+918765432109', '901 Jubilee Hills, Hyderabad, Telangana'),
(7, 'Ankita Rai', 'ankita.rai@gmail.com', 'anki90', '+918675432198', '102 Hillview Avenue, Noida, Uttar Pradesh'),
(8, 'Aditya Singh', 'aditya.singh@gmail.com', 'adiSingh89', '+917865432190', '56 Park Street, Kolkata, West Bengal'),
(9, 'Arjun Desai', 'arjun.desai@gmail.com', 'arjunDes12', '+919098765432', '78 Marine Drive, Mumbai, Maharashtra'),
(10,'Anita Joshi', 'anita.joshi@gmail.com', 'aniJos123', '+917898765432', '99 Residency Road, Jaipur, Rajasthan');

-- inserting data into Couriers table --

insert into Couriers 
values 
(1, 'Ravi Sharma', '123 MG Road, Indore, Madhya Pradesh', 'Amit Patel', '789 CG Road, Ahmedabad, Gujarat', 5.75, 'Delivered', 'IN1234567890', '2024-09-10'),
(2, 'Priya Verma', '456 Link Road, Pune, Maharashtra', 'Neha Kapoor', '234 Rajpath, New Delhi, Delhi', 2.50, 'In Transit', 'IN0987654321', '2024-09-18'),
(3, 'Amit Patel', '789 CG Road, Ahmedabad, Gujarat', 'Ravi Sharma', '123 MG Road, Indore, Madhya Pradesh', 7.30, 'Pending', 'IN1230987654', '2024-09-25'),
(4, 'Neha Kapoor', '234 Rajpath, New Delhi, Delhi', 'Rahul Gupta', '567 Anna Nagar, Chennai, Tamil Nadu', 4.20, 'Shipped', 'IN4561237890', '2024-09-20'),
(5, 'Rahul Gupta', '567 Anna Nagar, Chennai, Tamil Nadu', 'Priya Verma', '456 Link Road, Pune, Maharashtra', 3.15, 'Delivered', 'IN7896541230', '2024-09-05'),
(6, 'Sumit Reddy', '901 Jubilee Hills, Hyderabad, Telangana', 'Ankita Rai', '102 Hillview Avenue, Noida, Uttar Prades',1.80, 'Delivered', 'IN6549871230', '2024-09-12'),
(7, 'Ankita Rai', '102 Hillview Avenue, Noida, Uttar Pradesh', 'Aditya Singh', '56 Park Street, Kolkata, West Bengal', 6.25, 'In Transit', 'IN7893214560', '2024-09-14'),
(8, 'Aditya Singh', '56 Park Street, Kolkata, West Bengal', 'Arjun Desai', '78 Marine Drive, Mumbai, Maharashtra', 8.90, 'Pending', 'IN3216549870', '2024-09-22'),
(9, 'Arjun Desai', '78 Marine Drive, Mumbai, Maharashtra', 'Anita Joshi', '99 Residency Road, Jaipur, Rajasthan', 3.50, 'Shipped', 'IN6543217890', '2024-09-21'),
(10, 'Anita Joshi', '99 Residency Road, Jaipur, Rajasthan', 'Ravi Sharma', '123 MG Road, Indore, Madhya Pradesh', 2.10, 'In Transit', 'IN9874561230', '2024-09-25');

-- inserting data into CourierServices table --

insert into CourierServices
values 
(1, 'Standard Delivery', 100.00),
(2, 'Express Delivery', 250.00),
(3, 'Overnight Delivery', 500.00),
(4, 'Same Day Delivery', 1000.00),
(5, 'International Delivery', 3000.00),
(6, 'Economy Delivery', 80.00),
(7, 'Two-Day Delivery', 350.00),
(8, 'Priority Mail', 450.00),
(9, 'Bulk Delivery', 700.00),
(10, 'Drone Delivery', 1500.00);

-- inserting data into Employees table --

insert into Employees
values 
(1, 'Vikram Singh', 'vikram.singh@courierindia.com', '+919876543201', 'Manager', 75000.00),
(2, 'Sana Patel', 'sana.patel@courierindia.com', '+919876543202', 'Customer Support', 30000.00),
(3, 'Anil Kumar', 'anil.kumar@courierindia.com', '+919876543203', 'Delivery Executive', 35000.00),
(4, 'Preeti Mishra', 'preeti.mishra@courierindia.com', '+919876543204', 'HR', 50000.00),
(5, 'Karthik Reddy', 'karthik.reddy@courierindia.com', '+919876543205', 'Finance Manager', 60000.00),
(6, 'Sunil Sharma', 'sunil.sharma@courierindia.com', '+919876543206', 'IT Support', 40000.00),
(7, 'Ajay Gupta', 'ajay.gupta@courierindia.com', '+919876543207', 'Marketing Head', 70000.00),
(8, 'Rajesh Jain', 'rajesh.jain@courierindia.com', '+919876543208', 'Sales Executive', 30000.00),
(9, 'Raj Kumar', 'raj.kumar@courierindia.com', '+919876543209', 'Legal Advisor', 55000.00),
(10, 'Manoj Deshmukh', 'manoj.deshmukh@courierindia.com', '+919876543210', 'Operations Head', 80000.00);

-- inserting data into Location table --

insert into Location
values
(1, 'Indore Hub', '12, Industrial Area, Indore, Madhya Pradesh'),
(2, 'Mumbai Warehouse', '43, Andheri West, Mumbai, Maharashtra'),
(3, 'Ahmedabad Warehouse', '19, SG Highway, Ahmedabad, Gujarat'),
(4, 'New Delhi Distribution Center', '55, Janpath Road, New Delhi, Delhi'),
(5, 'Chennai Hub', '89, T Nagar, Chennai, Tamil Nadu'),
(6, 'Hyderabad Warehouse', '67, Madhapur, Hyderabad, Telangana'),
(7, 'Kolkata Warehouse', '56, Salt Lake City, Kolkata, West Bengal'),
(8, 'Noida Distribution Center', '12, M G Road, Noida, Uttar Pradesh'),
(9, 'Jaipur Hub', '23, Vaishali Nagar, Jaipur, Rajasthan'),
(10, 'Pune Hub', '87, Shivaji Nagar, Pune, Maharashtra');

-- inserting values into Payment table --

insert into Payment 
values 
(1, 1, 1, 750.00, '2024-09-11'),
(2, 2, 2, 500.00, '2024-09-18'),
(3, 3, 3, 1000.00, '2024-09-25'),
(4, 4, 4, 1200.00, '2024-09-20'),
(5, 5, 5, 1500.00, '2024-09-06'),
(6, 6, 6, 850.00, '2024-09-12'),
(7, 7, 7, 550.00, '2024-09-15'),
(8, 8, 8, 1100.00, '2024-09-22'),
(9, 9, 9, 900.00, '2024-09-21'),
(10, 10, 10, 1300.00, '2024-09-25');

