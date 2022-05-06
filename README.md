<h1>Database Final Project</h1>
Professor: Larry W. Clement

<h3>Team</h3>

- Daniel Furdui https://github.com/DanielFurdui
- Yutian Yang https://github.com/YutianYang709631
- Nathanial Furdui 
- Victor Omusi https://github.com/VictorOmusi

<h3>Project description</h3>

This project is for our EGR325 course here at California Baptist Univeristy.
>Each team will select one of the three organization types ( education, restaurant, church)
and design and implement a relational database system to support the organization's mission. The team will then begin the design process immediately after the organization has been selected.Given that the main purpose of this project is to unify the different learned concepts and reinforce learning, a minimum of 8 and a maximum of 10 tables is allowed in your database. 


<h3>Schedule</h3>

![image](https://user-images.githubusercontent.com/55105216/167082407-28aafbb7-d183-459d-a7f5-3d33a3993136.png)

<h3>Project Plan</h3>

>The database design we have in mind is for a dine-in restaurant with two employees, the chef, and the waiter. The restaurant will have a waitlist which all parties will be put on when first attending the restaurant. Once the waiter has picked an appropriate table for the party, the waiter will move the party from the waitlist to a table. Once seated, the waiter will take the orders from the party and send it to the chef. The chef will make the food and give it back to the waiter to take to the table. Once the party has finished eating, the waiter will return a receipt with the added total. Including tax and a tip.

<h3>User Stories</h3>

>As a Waiter, I would like to add parties to the waitlist so that I can check for any available tables.

>As a Waiter, I want to assign parties to the appropriate sized table so that I can know if I can seat them.

>As a Waiter, I want to know if a table is occupied so that I can assign a party to a table if it is or not.

>As a Waiter, I would like to assign a party to a table from a tablet so that the table can show that it’s occupied.

>As a Waiter, I want the party to be removed from waitlist when seated so that I know that they’re not waiting for a table anymore.

>As a Waiter, I would like to take orders from a tablet so that I won’t need to write it down on paper.

>As a Waiter, I would like to see all purchasable foods from the tablet so that I won’t forget what’s available.

>As a Waiter, I want to keep track of the quantity of an item so that I don’t need to add another order of the same item.

>As a Waiter, I want to know the price of an item so that the party is informed.

>As a Waiter, I would like to send the order to the chef from the tablet so that I wouldn’t need to walk to the kitchen.

>As a Waiter, I want to print the order, order total with tax from the tablet so that I wouldn’t need to go to a computer to do it.

>As a Waiter, I would like to keep track of all tips from the tablet so that it can be even distributed to all employees.

<h3>System Inputs/Outputs</h3>

![image](https://user-images.githubusercontent.com/55105216/167084152-ef4236ac-9205-404e-9695-baf7ea5c380e.png)

![image](https://user-images.githubusercontent.com/55105216/167084187-704b1fe2-4493-4ca7-89dc-fdf1d4743983.png)


<h3>Business Logic</h3>

- When a party arrives, they are first put onto the waitlist and then seated.
- The restaurant only takes card as payment.
- Parties that are greater than our biggest table can not be seated. (Sorry)
