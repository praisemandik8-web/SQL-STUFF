-- QuickRide Capstone — SQL Queries

-- Q1. Completed trips with rider and driver names

SELECT
    t.trip_id,
    r.rider_name,
    d.driver_name,
    t.city,
    t.fare
FROM trips t
JOIN riders r
    ON t.rider_id = r.rider_id
JOIN drivers d
    ON t.driver_id = d.driver_id
WHERE t.status = 'Completed';

-- Q2. All Lagos trips

SELECT
    r.rider_name,
    d.driver_name,
    d.vehicle_type,
    t.fare
FROM trips t
JOIN riders r
    ON t.rider_id = r.rider_id
JOIN drivers d
    ON t.driver_id = d.driver_id
WHERE t.city = 'Lagos';

-- Q3. Most valuable riders by total spend

SELECT
    r.rider_id,
    r.rider_name,
    SUM(t.fare) AS total_spend
FROM riders r
JOIN trips t
    ON r.rider_id = t.rider_id
WHERE t.status = 'Completed'
GROUP BY
    r.rider_id,
    r.rider_name
ORDER BY total_spend DESC;

-- Q4. Driver scorecard

SELECT
    d.driver_id,
    d.driver_name,
    COUNT(t.trip_id) AS completed_trips,
    AVG(t.rating) AS average_rating
FROM drivers d
LEFT JOIN trips t
    ON d.driver_id = t.driver_id
    AND t.status = 'Completed'
GROUP BY
    d.driver_id,
    d.driver_name;

-- Q5. Trips costing more than the average completed fare

SELECT *
FROM trips
WHERE status = 'Completed'
  AND fare > (
      SELECT AVG(fare)
      FROM trips
      WHERE status = 'Completed'
  );

-- Q6. Drivers who have never had a cancelled trip

SELECT
    d.driver_id,
    d.driver_name
FROM drivers d
WHERE NOT EXISTS (
    SELECT 1
    FROM trips t
    WHERE t.driver_id = d.driver_id
      AND t.status = 'Cancelled'
);

-- Q7. Rider who took the most expensive trip

SELECT
    r.rider_name,
    t.trip_id,
    t.fare
FROM trips t
JOIN riders r
    ON t.rider_id = r.rider_id
WHERE t.fare = (
    SELECT MAX(fare)
    FROM trips
);

-- Q8. Riders who have taken more trips than Chioma Bello

SELECT
    r.rider_name,
    COUNT(t.trip_id) AS trip_count
FROM riders r
JOIN trips t
    ON r.rider_id = t.rider_id
GROUP BY
    r.rider_id,
    r.rider_name
HAVING COUNT(t.trip_id) > (
    SELECT COUNT(t2.trip_id)
    FROM trips t2
    JOIN riders r2
        ON t2.rider_id = r2.rider_id
    WHERE r2.rider_name = 'Chioma Bello'
);

-- Q9. Riders who have given at least one 5-star rating

SELECT DISTINCT
    r.rider_id,
    r.rider_name
FROM riders r
JOIN trips t
    ON r.rider_id = t.rider_id
WHERE t.rating = 5.0;

-- Q10. Combined rider and driver contact list

SELECT
    rider_name AS name,
    city,
    'Rider' AS role
FROM riders

UNION ALL

SELECT
    driver_name AS name,
    home_city AS city,
    'Driver' AS role
FROM drivers;

-- Q11. Every city QuickRide operates in

SELECT city
FROM trips

UNION

SELECT home_city
FROM drivers;

-- Q12. Driver who has earned the most money

SELECT
    d.driver_name,
    SUM(t.fare) AS total_earnings
FROM drivers d
JOIN trips t
    ON d.driver_id = t.driver_id
WHERE t.status = 'Completed'
GROUP BY
    d.driver_id,
    d.driver_name
ORDER BY total_earnings DESC
LIMIT 1;

-- Findings and Recommendations

-- One important finding is that Samuel Bello is QuickRide's biggest-spending rider, spending ₦42,000 on completed trips. QuickRide should consider giving high-value riders such as Samuel loyalty rewards or other incentives to encourage them to continue using the service.

-- Another important finding is that Bola Ogun is the highest-earning driver, generating ₦56,890 from completed trips. QuickRide should recognize and retain high-performing drivers like Bola, while studying what makes their performance successful so the company can encourage similar performance from other drivers.-- 