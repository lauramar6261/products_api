# README

# ProductsAPI
This products API implementation keeps track of all products an user owns.

## Functionality
This API comes pre-packaged with most of the functionality that you will require. The following endpoints are implemented

### Products

```
GET /products
```
List all products in the products library


```
GET /products/:upc
```
Show details for a single movie by UPC code

```
POST /products/
```
Add a new product

```
GET /products/overdue
```
List all the products that have expired

```
PUT /products/:upc
```
Update a product

```
DELTE /products/:upc
```
Delete a product

#### Terminology

UPC = The Universal Product Code is a barcode symbology that is widely used in the United States, Canada, United Kingdom, Australia, New Zealand, in Europe and other countries for tracking trade items in stores. UPC consists of 12 numeric digits that are uniquely assigned to each trade item.

#### Running tests
| Command                    | Result                                              |
| -------------------------- | --------------------------------------------------- |
| rails test                 | Run all tests                                       |
| rails test test/models     | Run tests in test/models                            |

#### Ruby version

ruby 2.5.1p57
