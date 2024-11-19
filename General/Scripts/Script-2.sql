CREATE TABLE P_EMP (
    EmployeeID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT
);

CREATE TABLE P_DEP (
    DepartmentID INT NOT NULL PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO P_EMP (EmployeeID, Name, DepartmentID) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 101),
(4, 'David', 103);

INSERT INTO P_DEP (DepartmentID, DepartmentName) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Marketing'),
(104, 'Sales');

SELECT E.Name, D.DepartmentName
FROM P_EMP E
CROSS JOIN P_DEP D;