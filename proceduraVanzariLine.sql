SELECT
    YEAR(CONVERT(DATE, FV.dataVanzare)) AS AnVanzare,
    SUM(FV.pretVanzare) AS ValoareTotalaVanzari
FROM
    FacturaVanzare FV
INNER JOIN
    Diamant D ON FV.diamantId = D.diamantId
GROUP BY
    YEAR(CONVERT(DATE, FV.dataVanzare))
ORDER BY
    YEAR(CONVERT(DATE, FV.dataVanzare));
