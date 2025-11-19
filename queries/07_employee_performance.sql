SELECT
    e.FirstName || ' ' || e.LastName AS EmployeeName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM
    Orders o
JOIN
    "Order Details" od ON o.OrderID = od.OrderID
JOIN
    Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY
    e.EmployeeID, EmployeeName
ORDER BY
    TotalSales DESC;
