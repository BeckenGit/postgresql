DROP TABLE weather;
DROP TABLE cities;
CREATE TABLE weather (
	city		varchar(80),
	temp_lo		int,		-- low temperature
	temp_hi		int,		-- high temperature
	prcp		real,		-- precipitation
	date		date
);

CREATE TABLE cities (
	name		varchar(80),
	location	point
);
COPY weather FROM '/home/becken/postgresql/weather.txt' WITH(FORMAT csv);
COPY cities FROM '/home/becken/postgresql/cities_basic.txt';

SELECT city, temp_lo, rank() OVER(ORDER BY temp_lo) FROM weather;
SELECT CAST(sqrt(2) AS int);
