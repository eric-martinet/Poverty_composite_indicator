# Determine latest available year by country
CREATE TEMPORARY TABLE _CountryLatestAvailableYear
SELECT CountryName, MAX(Year) as LatestAvailableYear
FROM _CompositeIndicator
GROUP BY CountryName;

SELECT * FROM _CountryLatestAvailableYear;

# Display all indicators for all countries for latest available year, sorted by alphabetical order
SELECT CI.CountryName, CI.IncomeLevel, CLAY.LatestAvailableYear, CI.CostClosingRPovertyPercGDP, CI.CostClosingRPoverty, CI.Population, CI.GDP, CI.PovertyGap, CI.PovertyLine
FROM _CompositeIndicator CI
INNER JOIN _CountryLatestAvailableYear CLAY
ON CI.CountryName = CLAY.CountryName AND CI.Year = CLAY.LatestAvailableYear
ORDER BY CI.CountryName;

# Display all indicators for top 5 countries in Cost of Closing Relative Poverty as % of GDP (top = less) for latest available year
SELECT CI.CountryName, CI.IncomeLevel, CLAY.LatestAvailableYear, CI.CostClosingRPovertyPercGDP, CI.CostClosingRPoverty, CI.Population, CI.GDP, CI.PovertyGap, CI.PovertyLine, CI.PovertyLinePercGDPCap
FROM _CompositeIndicator CI
INNER JOIN _CountryLatestAvailableYear CLAY
ON CI.CountryName = CLAY.CountryName AND CI.Year = CLAY.LatestAvailableYear
ORDER BY CI.CostClosingRPovertyPercGDP ASC
LIMIT 5;
# Ireland is the country for which the cost-to-GDP of closing relative poverty is the lowest (3.2%).
# The top 5 countries tend to have a poverty line relatively low compared to the GDP per capita (around 20% or below).
# It denotes relative equality among the general population as the poverty line is half the media disposable income.

# Display all indicators for bottom 5 countries in Cost of Closing Relative Poverty as % of GDP (bottom = greater) for latest available year
SELECT CI.CountryName, CI.IncomeLevel, CLAY.LatestAvailableYear, CI.CostClosingRPovertyPercGDP, CI.CostClosingRPoverty, CI.Population, CI.GDP, CI.PovertyGap, CI.PovertyLine, CI.PovertyLinePercGDPCap
FROM _CompositeIndicator CI
INNER JOIN _CountryLatestAvailableYear CLAY
ON CI.CountryName = CLAY.CountryName AND CI.Year = CLAY.LatestAvailableYear
ORDER BY CI.CostClosingRPovertyPercGDP DESC
LIMIT 5;
# USA is the country for which the cost-to-GDP of closing relative poverty is the highest (12.1%)
# Due to the size of US economy, it is equal to the GDP of Italy in absolute value!
# The bottom 5 countries tend to have a poverty line relatively high compared to the GDP per capita (around 30% or more).
# It denotes relative inequality among the general populationas as the poverty line is half the media disposable income.
