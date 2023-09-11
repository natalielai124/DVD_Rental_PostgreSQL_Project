# DVD Rental Analysis Project

## Project Overview 
Welcome to the DVD Rental Analysis Project repository! In this project, we will explore and analyze a DVD rental database using SQL. This README file will provide you with an overview of the project and guide you through the various aspects of the analysis. This DVD Rental Analysis Project focuses on:

- Data Exploration: Understand the database structure and content.

- Question Formulation: Create business questions for SQL queries.

- SQL Query Development: Craft queries to extract and analyze data.

- Documentation: Maintain records of the analysis process and findings.

## Repository Contents 
- DVD_query_**x**: Included in this repository are SQL query files labeled as "Query 1" through "Query 7," along with corresponding CSV result files for each query.
 
- DVD_query_**x**_result: Included in this repository are the CSV results for each query.
  
- Practice_**x**: Included in this repository are SQL query files named "Practice_1" through "Practice_3." These files have been designed to serve as practice exercises for honing your skills in working with various SQL functions and crafting - complex queries. 

- README.md: You are currently reading this README file, which provides an overview of the project.

## Database Schema 
The DVD Rental database schema is organized into **_15_** tables, each representing different aspects of the DVD rental business. 
Here's an overview of the key tables and their relationships with an ER Diagram (ERD):

<details>
<summary> Data Tables Description </summary>
<text> 

- _actor_ Table: Manages actor information, including first and last names.
  
- _address_ Table: Contains data about the rental stores, including the store manager and address. 

- _category_ Table: Manages the category/ genre of films, and links films to their respective categories using category_id. 

- _city_ Table: Contains city names, and links to the country table and address table. 

- _country_ Table: Contains country names.
  
- _customer_ Table: Contains customer data, including names, addresses, and contact details. It links with the rental table and payment table as well. 

- _film_ Table: Contains comprehensive film data, such as title, description, release year, and rental rate. It links to the inventory table, film actor table, and language table. 

- _film_actor_ Table: Maintains relationships between films and actors. 

- _film_category_ Table: Manages the relationships between films and their assigned categories. 

- _inventory_ Table: Manages inventory data, and links DVDs (from the film table) to specific stores, helping track DVD availability. 

- _language_ Table: Manages language information about the languages spoken in films.

- _payment_ Table: Records payment transactions made by customers for DVD rentals.

- _rental_ Table: Records each DVD rental transaction, including the rental date, return date, and rental duration.

- _staff_ Table:  Manages information about store employees, including names, contact details, and roles.

- _store_ Table: Contains store-specific data.

</text>
</details>


![ER_Diagram_(ERD)](https://github.com/natalielai124/DVD_Rental_Project/assets/144147465/75e0c49b-c69b-43ac-943f-9273e46785fc)

## Insights
Here, you'll discover 8 intriguing insights unearthed upon the project's completion, corresponding to the 8 queries.

1. Check out which category has the highest inventory of films, and how many films are in that category?
2. Check out the customers who made the highest expenditures on DVD rentals and how many times they rented DVDs
3. Check out which films are frequently rented out, and the rental duration
4. Check out the Top 10 Countries by Revenue and Number of Films Released
5. Check out the Top 10 Cities by Revenue and Number of Films Released
6. Check out which year produced the Greatest Film Revenue
7. Check out the top 10 customer rent DVD
8. Check out which actor(s) is/ are the most productive (participated the most no. of film production)


## Reference 
Resources: https://www.postgresqltutorial.com/wp-content/uploads/2018/03/printable-postgresql-sample-database-diagram.pdf 

Dataset: https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/ https://www.w3schools.com/sql/default.asp


