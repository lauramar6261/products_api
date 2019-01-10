# README

# ProductsAPI
This products API implementation keeps track of all products an user owns.

## Functionality
This API comes pre-packaged with most of the functionality that you will require. The following endpoints are impemented

### Products

```
GET /products
```
List all movies in the products library


```
GET /movies/:id SHOULD BE BY UPC?
```
Show details for a single movie by `title`

### Rentals

```
POST /rentals/:title/check-out
```
Check out one of the movie's inventory to the customer. The rental's check-out date should be set to today.

```
POST /rentals/:title/return
```
Check in one of a customer's rentals

```
GET /rentals/overdue
```
List all customers with overdue movies



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
