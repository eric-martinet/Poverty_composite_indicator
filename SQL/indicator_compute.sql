# Poverty line is half of median disposable income, here converted in PPP
DROP TABLE IF EXISTS _PovertyLine;
CREATE TABLE IF NOT EXISTS _PovertyLine
SELECT PPP.C_ISO3 AS C_ISO3, PPP.Year AS Year, (MDI.Value / PPP.Value) / 2 AS Value
FROM OECD_PPP PPP
INNER JOIN OECD_MDI MDI
ON PPP.C_ISO3 = MDI.C_ISO3 AND PPP.Year = MDI.Year
;

# Table with all indicators and computation of composite indicator
DROP TABLE IF EXISTS _CompositeIndicator;
CREATE TABLE IF NOT EXISTS _CompositeIndicator
SELECT C.ISO3 AS CountryISO3, C.Name AS CountryName, IC.Name AS IncomeLevel, Pop.Year AS Year, Pop.Value AS Population, GDP.Value AS GDP, PGap.Value AS PovertyGap, ROUND(PLine.Value, 0) AS PovertyLine, Round(PLine.Value / ( GDP.Value / (Pop.Value / 1000000)), 2) AS PovertyLinePercGDPCap, ROUND((PGap.Value * PLine.Value * Pop.Value) / 1000000, 0) AS CostClosingRPoverty, ROUND(((PGap.Value * PLine.Value * Pop.Value) / 1000000) / GDP.Value, 3) AS CostClosingRPovertyPercGDP
FROM WB_Countries C
INNER JOIN WB_Population Pop
ON C.ISO3 = Pop.C_ISO3
INNER JOIN OECD_GDP GDP
ON C.ISO3 = GDP.C_ISO3 AND Pop.Year = GDP.Year
INNER JOIN OECD_PovertyGap PGap
ON C.ISO3 = PGap.C_ISO3 AND Pop.Year = PGap.Year
INNER JOIN _PovertyLine PLine
ON C.ISO3 = PLine.C_ISO3 AND Pop.Year = PLine.Year
INNER JOIN WB_IncomeLevels IC
ON C.WB_INCLEVEL_ID = IC.WB_INCLEVEL_ID
;
