#README

## Project Description

In this project, you will use Rails and ActiveRecord to build a JSON API which exposes the SalesEngine data schema.

## <a name="learning-goals"></a> Learning Goals

* Learn how to to build Single-Responsibility controllers to provide a well-designed and versioned API.
* Learn how to use controller tests to drive your design.
* Use Ruby and ActiveRecord to perform more complicated business intelligence.

## <a name="technical-expectations"></a> Technical Expectations

* All endpoints will expect to return JSON data
* All endpoints should be exposed under an `api` and version (`v1`)
namespace (e.g. `/api/v1/merchants.json`)
* JSON responses should included `ids` only for associated records unless otherwise indicated (that is, don't embed the whole associated record, just the id)
* Prices are in cents, therefore you will need to transform them in dollars. (`12345` becomes `123.45`)
* Remember that for a JSON string to be valid, it needs to contain a key and a value.

### Data Importing

* You will create an ActiveRecord model for each
entity included in the [sales engine data](https://github.com/turingschool/sales_engine/tree/master/data).
* Your application should include a rake task which imports all of the CSV's and creates the corresponding records.

### Endpoints

API Endpoints for this project can be grouped into 3 categories. They are Record Endpoints, Relationship Endpoints, and Business Intellignence Endpoints. Record Endpoints simply display data that correspond to any given model. Relationship Endpoints display data for model that is scoped to a specific record. Business Intelligence Endpoints display data that is retrieved and calculated using complex ActiveRecord queries. Often these endpoints reqiure parameters such as a date, quantity, or id.

### Evaluation

The project is evaluated in several categories such as feature completeness, code quality, query quality, and test coverage. The project must be run against a [spec harness](https://github.com/turingschool/rales_engine_spec_harness) with over 36,000 assertions.
