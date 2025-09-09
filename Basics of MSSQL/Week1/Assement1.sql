CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Region VARCHAR(50)
);

CREATE TABLE SmartMeterReadings (
    MeterId INT PRIMARY KEY,
    CustomerId INT,
    Location VARCHAR(255),
    InstalledDate DATE,
    ReadingDateTime DATETIME,
    EnergyConsumed DECIMAL(10, 2),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);


-- Data Insertion
INSERT INTO Customers (CustomerId, Name, Address, Region) VALUES
(1, 'Alice Smith', '123 Main St, CityA', 'North'),
(2, 'Bob Johnson', '456 Oak Ave, CityB', 'South'),
(3, 'Charlie Brown', '789 Pine Rd, CityC', 'East'),
(4, 'Diana Prince', '101 Elm Ln, CityD', 'West'),
(5, 'Eve Adams', '202 Birch Blvd, CityE', 'North');

-- Data Insertion

INSERT INTO SmartMeterReadings (MeterId, CustomerId, Location, InstalledDate, ReadingDateTime, EnergyConsumed) VALUES
(101, 1, 'Kitchen', '2023-01-15', NULL, NULL),
(102, 2, 'Living Room', '2023-05-20', NULL, NULL),
(103, 3, 'Bedroom', '2024-02-10', NULL, NULL),
(104, 4, 'Garage', '2024-07-01', NULL, NULL),
(105, 5, 'Basement', '2023-11-30', NULL, NULL);


select * from Customers
select * from SmartMeterReadings

--task

UPDATE SmartMeterReadings
SET
    ReadingDateTime = '2024-03-10 10:30:00',
    EnergyConsumed = 25.5
WHERE MeterId = 101;

UPDATE SmartMeterReadings
SET
    ReadingDateTime = '2024-05-22 14:00:00',
    EnergyConsumed = 40.0
WHERE MeterId = 103;


SELECT
    MeterId,
    ReadingDateTime,
    EnergyConsumed
FROM
    SmartMeterReadings
WHERE
    EnergyConsumed BETWEEN 10 AND 50
    AND ReadingDateTime BETWEEN '2024-01-01' AND '2024-12-31'
    AND InstalledDate <= '2024-06-30';


-- task 2

    SELECT COUNT(*) FROM SmartMeterReadings;


    SELECT CustomerID, AVG(EnergyConsumed) AS AvgEnergyConsumed, MAX(EnergyConsumed) AS MaxEnergyConsumed
FROM SmartMeterReadings
GROUP BY CustomerID
ORDER BY CustomerID;

