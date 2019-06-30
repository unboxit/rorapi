# Products API [![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/eb06622cdbf89dce2474#?env%5BPRODUCTS-LOCAL%5D=W3sia2V5IjoidXJsIiwidmFsdWUiOiJodHRwOi8vbG9jYWxob3N0OjMwMDAiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImJyYW5kX2lkIiwidmFsdWUiOiJ0aGUtYnJhbmQtaWQiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6ImNhdGVnb3J5X2lkIiwidmFsdWUiOiJ0aGUtY2F0ZWdvcnktaWQiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6InByb2R1Y3RfaWQiLCJ2YWx1ZSI6InRoZS1wcm9kdWN0LWlkIiwiZW5hYmxlZCI6dHJ1ZX0seyJrZXkiOiJuZXdfYnJhbmRfbmFtZSIsInZhbHVlIjoibmV3LWJyYW5kLW5hbWUiLCJlbmFibGVkIjp0cnVlfSx7ImtleSI6Im5ld19jYXRlZ29yeV9uYW1lIiwidmFsdWUiOiJuZXctY2F0ZWdvcnktbmFtZSIsImVuYWJsZWQiOnRydWV9LHsia2V5IjoibmV3X3Byb2R1Y3RfbmFtZSIsInZhbHVlIjoibmV3LXByb2R1Y3QtbmFtZSIsImVuYWJsZWQiOnRydWV9XQ==) [![Build Status](https://travis-ci.org/unboxit/rorapi.svg?branch=master)](https://travis-ci.org/unboxit/rorapi)

#### Ruby version
`ruby 2.5.3p105 (2018-10-18 revision 65156) [x86_64-linux]`

#### System dependencies
`docker`, `docker-compose`

#### Database creation

`$ docker-compose run web rake db:migrate`

#### Database initialization

`$ docker-compose run web rake db:seed`

#### How to run the test suite

`$ docker-compose run web bundle exec rspec`


#### Development
Design DB Diagram using https://dbdiagram.io

```sql
Table products {
  id int [pk]
  name varchar
  status varchar
  category_id int
  brand_id int
}

Table categories {
  id int [pk]
  name varchar
  brand_id int
}

Table brands {
  id int [pk]
  name varchar
}

Ref: products.category_id > categories.id
Ref: products.brand_id > brands.id
Ref: categories.brand_id > brands.id
```
