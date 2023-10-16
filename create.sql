CREATE TABLE `Billing` (
  `ID` int NOT NULL,
  `CardNo` varchar(45) DEFAULT NULL,
  `CardName` varchar(45) DEFAULT NULL,
  `BookingNumber` int DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `BillingType` varchar(45) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Paid Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Employee` (
  `ID` int NOT NULL,
  `HotelLocation` varchar(45) NOT NULL,
  `HotelName` varchar(45) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Role` varchar(45) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`,`HotelLocation`,`HotelName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Guests` (
  `ID` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Hotel` (
  `Location` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Name`,`Location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Payment` (
  `CardNo` varchar(16) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `ExpirationDate` varchar(45) DEFAULT NULL,
  `PostalCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CardNo`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Purchase` (
  `Id` int NOT NULL,
  `BookingNumber` int NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `ItemName` varchar(45) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`Id`,`BookingNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ReservationInfo` (
  `BookingNumber` int NOT NULL,
  `GuestID` int DEFAULT NULL,
  `NumberOfRooms` varchar(45) DEFAULT NULL,
  `NumberOfGuests` varchar(45) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `ReservationDate` datetime DEFAULT NULL,
  `BookingSite` varchar(45) DEFAULT NULL,
  `SpecialRequest` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BookingNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Room` (
  `HotelName` varchar(45) NOT NULL,
  `HotelLocation` varchar(45) NOT NULL,
  `RoomNumber` varchar(45) NOT NULL,
  `Price` int DEFAULT NULL,
  `Availability` varchar(45) DEFAULT NULL,
  `TypeName` varchar(45) DEFAULT NULL,
  `Beds` varchar(45) DEFAULT NULL,
  `hasBreakfast` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`HotelName`,`HotelLocation`,`RoomNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Shift` (
  `ID` int NOT NULL,
  `EmployeeID` int DEFAULT NULL,
  `HotelLocation` varchar(45) DEFAULT NULL,
  `HotelName` varchar(45) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Task` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Stay` (
  `BookingNumber` int NOT NULL,
  `HotelName` varchar(45) NOT NULL,
  `HotelLocation` varchar(45) NOT NULL,
  `RoomNumber` varchar(45) DEFAULT NULL,
  `CheckIn` varchar(45) DEFAULT NULL,
  `CheckOut` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BookingNumber`,`HotelName`,`HotelLocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
