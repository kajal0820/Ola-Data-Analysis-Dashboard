use ola;
Create View Successful_Bookings As
SELECT*FROM bookings
WHERE Booking_Status="Success";
#1. Retrieve all successful bookings:
Select*FROM Successful_Bookings;

#2.Find the Average ride distance for  each vehicle type:
create View ride_distance_for_each_vehicle As
SELECT Vehicle_Type , AVG(Ride_Distance)
AS avg_distance from bookings
group by Vehicle_Type;

Select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancel rides by customer
Create View cancel_rides_by_customers AS
SELECT COUNT(*) FROM bookings
WHERE Booking_Status='Canceled by Customer';

Select * from cancel_rides_by_customers;

#4.List the top 5 customers who booked the highest number of rides:
Create  View top_5_customers AS
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
group by Customer_ID
ORDER BY total_rides DESC LIMIT 5;
Select * from top_5_customers;

#5. Get the number of rides cancelled by drivers due to personal and car related issues:
Create View Rides_Canceled_by_Drivers_P_C_Issues As
SELECT COUNT(*) FROM bookings 
WHERE Canceled_Rides_By_Driver='Personal &Car Related issue';

#6.Find the maximum and minimum drivers ratings for Prime Sedan booking:
create View max_min_Driver_Rating AS
select MAX(Driver_Ratings) AS max_ratings,
MIN(Driver_Ratings) AS min_ratings
FROM bookings WHERE Vehicle_Type='Prime Sedan';

#7. Retrieve all rides where payment was made using UPI;
Create View UPI_Payment AS
select* from bookings where Payment_Method="UPI";

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_ratings AS
Select Vehicle_type, avg(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

#9. Calcuate the total booking rides completed successfully:
Create View total_successful_ride_value AS
SELECT SUM(Booking_Value) as total_successful_ride_value
FROM bookings
WHERE Booking_Status="Success";
 
#10. List all incomplete rides along with the reason:
Create view Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides="Yes";
 





