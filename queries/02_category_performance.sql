SELECT
    strftime('%Y', o.OrderDate) AS OrderYear,
    c.CategoryName,
    SUM(od.Quantity) AS TotalUnitsSold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM
    Orders o
JOIN
    "Order Details" od ON o.OrderID = od.OrderID
JOIN
    Products p ON od.ProductID = p.ProductID
JOIN
    Categories c ON p.CategoryID = c.CategoryID
GROUP BY
    OrderYear, c.CategoryName
ORDER BY
    OrderYear, TotalRevenue DESC;
