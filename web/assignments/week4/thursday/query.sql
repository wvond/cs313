/* \echo '*********************List all restaurant names*********************'
SELECT NAME FROM w4_restaurant;

\echo '****************List restaurant names and addresses****************'
SELECT NAME || ' - ' || address AS Restaurant List FROM w4_restaurant;

\echo '************************List  all customers************************'
SELECT first_name || ' ' || last_name AS full_name FROM w4_customer;

\echo '**List  all menu item names and prices of a particular restaurant**'
SELECT name || ' - $' || price as menu FROM w4_menu_item WHERE restaurant_id = 3;

\echo '*View all orders of a particular customer - show the customer name*'
SELECT o.id, c.first_name || ' ' || c.last_name AS "Customer Name"
FROM w4_order o
JOIN w4_customer c 
ON o.customer_id = c.id
WHERE o.customer_id = 1;

/*
    SELECT c.first_name AS "First Name"
    , c.last_name AS "Last Name"
    , mi.name AS "Menu Item Name"
    , mi.price
    FROM w4_customer c
    INNER JOIN w4_order o ON 
*/

*/
\echo '************List  all orders of a particular restaurant************'
SELECT r.name  AS "Restaurant"
, om.order_id AS "Order #"
, mi.name AS "Food"
, mi.price::float::numeric


