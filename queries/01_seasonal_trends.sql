SELECT
    strftime('%Y-%m', o.OrderDate) AS OrderMonth,
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM
    Orders o
JOIN
    "Order Details" od ON o.OrderID = od.OrderID
GROUP BY
    OrderMonth
ORDER BY
    OrderMonth;
