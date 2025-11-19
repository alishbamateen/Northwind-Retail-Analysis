SELECT
    p.ProductName,
    strftime('%Y-%m', o.OrderDate) AS OrderMonth,
    SUM(od.Quantity) AS MonthlyUnitsSold,
    SUM(SUM(od.Quantity)) OVER (
        PARTITION BY p.ProductID
        ORDER BY strftime('%Y-%m', o.OrderDate)
        ROWS UNBOUNDED PRECEDING
    ) AS RunningTotal
FROM
    Orders o
JOIN
    "Order Details" od ON o.OrderID = od.OrderID
JOIN
    Products p ON od.ProductID = p.ProductID
GROUP BY
    p.ProductID, p.ProductName, OrderMonth
ORDER BY
    p.ProductName, OrderMonth;
