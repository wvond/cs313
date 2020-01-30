\echo '*********************List all restaurant names*********************'
SELECT NAME
FROM w4_restaurant;

\echo '****************List restaurant names and addresses****************'
SELECT NAME || ' - ' || address AS Restaurant List
FROM w4_restaurant;

\echo '************************List  all customers************************'
SELECT first_name || ' ' || last_name AS full_name
FROM w4_customer;

\echo '**List  all menu item names and prices of a particular restaurant**'
SELECT name || ' - $' || price as menu
FROM w4_menu_item
WHERE restaurant_id = 3;

\echo '*View all orders of a particular customer - show the customer name*'
SELECT o.id,
       c.first_name || ' ' || c.last_name AS "Customer Name"
FROM w4_order o
JOIN w4_customer c ON o.customer_id = c.id
WHERE o.customer_id = 1;

SELECT c.first_name AS "First Name"
     , c.last_name  AS "Last Name"
     , mi.name      AS "Menu item name"
     , mi.price
FROM       w4_customer         c 
INNER JOIN w4_order            o  ON c.id  = o.customer_id
INNER JOIN w4_order_menu_items om ON o.id  = om.order_id
INNER JOIN w4_menu_item        mi ON mi.id = om.menu_item_id
WHERE c.id = 1
ORDER BY mi.price;

\echo '************List  all orders of a particular restaurant************'
SELECT r.name AS "Restaurant",
       om.order_id AS "Order #",
       mi.name AS "Food",
       mi.price::float8::numeric::money AS "Price"
FROM w4_restaurant r
INNER JOIN w4_menu_item mi ON r.id = mi.restaurant_id
INNER JOIN w4_order_menu_items om ON mi.id = om.menu_item_id
WHERE r.id = 6;

