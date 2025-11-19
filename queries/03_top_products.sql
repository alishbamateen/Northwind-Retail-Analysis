SELECT
    p.ProductName,
    c.CategoryName,
    SUM(od.Quantity) AS TotalUnitsSold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM
    "Order Details" od
JOIN
    Products p ON od.ProductID = p.ProductID
JOIN
    Categories c ON p.CategoryID = c.CategoryID
GROUP BY
    p.ProductID, p.ProductName, c.CategoryName
ORDER BY
    TotalRevenue DESC
LIMIT 15;
