SELECT
    CONVERT(DATE, FV.dataVanzare) AS DataVanzare,
    SUM(FV.pretVanzare) AS ValoareTotalaVanzari
FROM
    FacturaVanzare FV
INNER JOIN
    Diamant D ON FV.diamantId = D.diamantId
GROUP BY
    CONVERT(DATE, FV.dataVanzare)
ORDER BY
    CONVERT(DATE, FV.dataVanzare);
