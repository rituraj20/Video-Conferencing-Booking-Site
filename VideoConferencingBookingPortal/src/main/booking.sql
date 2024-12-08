CREATE TABLE Booking (
    booking_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    empid varchar(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    FOREIGN KEY (empid) REFERENCES Customer(empid) ON DELETE CASCADE
);
