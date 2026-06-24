TRUNCATE TABLE public.dim_date;

INSERT INTO public.dim_date (datekey, date, year, quarter, month, monthname, monthshort, week, dayofweek, yearmonth, isweekend)
SELECT
    TO_CHAR(d, 'YYYYMMDD')::INT,
    d,
    EXTRACT(YEAR FROM d)::INT,
    EXTRACT(QUARTER FROM d)::INT,
    EXTRACT(MONTH FROM d)::INT,
    TO_CHAR(d, 'Month'),
    TO_CHAR(d, 'Mon'),
    EXTRACT(WEEK FROM d)::INT,
    EXTRACT(DOW FROM d)::INT,
    TO_CHAR(d, 'YYYYMM')::INT,
    EXTRACT(DOW FROM d) IN (0,6)
FROM GENERATE_SERIES('2015-01-01'::DATE, '2018-12-31'::DATE, '1 day') AS d;