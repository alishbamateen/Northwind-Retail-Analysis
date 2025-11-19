SELECT
    p.ProductName,
    p.UnitsInStock,
    SUM(od.Quantity) AS TotalOrderedSoFar,
    (SUM(od.Quantity) - p.UnitsInStock) AS DemandMinusStock
FROM
    Products p
JOIN
    "Order Details" od ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID, p.ProductName, p.UnitsInStock
HAVING
    TotalOrderedSoFar > p.UnitsInStock
ORDER BY
    DemandMinusStock DESC;
