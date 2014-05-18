[![Dependency Status](https://gemnasium.com/ziggurat/prodetotal2.svg)](https://gemnasium.com/ziggurat/prodetotal2)
[![Code Climate](https://codeclimate.com/github/ziggurat/prodetotal2.png)](https://codeclimate.com/github/ziggurat/prodetotal2)
[![Coverage Status](https://coveralls.io/repos/ziggurat/prodetotal2/badge.png?branch=master)](https://coveralls.io/r/ziggurat/prodetotal2?branch=master)

Prode Total
===========

## API
### [Competitions](#competitions)

<a name="competitions"/>
#### Competitions
* [GET '/competitions'](#getcompetitions)
* [GET '/competitions/:competition_id'](#getcompetitions/competition_id)
* [POST '/competitions'](#postcompetitions)

<a name="getcompetitions"/>
##### GET '/competitions'
````json
GET '/competitions'
[
  {
    "id": 1,
    "exact_match_points": 6,
    "result_match_points": 3,
    "no_match_points": 0,
    "no_forecast_points": 0,
    "name": "Copa del Mundo Brasil 2014",
    "start_date": "2014-03-31",
    "end_date": "2014-03-31",
    "created_at": "2014-05-18T16:26:42.188Z",
    "updated_at": "2014-05-18T16:26:42.188Z"
  },
  {...}
]
````
<a name="getcompetitions/competition_id"/>
##### GET '/competitions/:competition_id'
````json
GET '/competitions/:competition_id'
{

}
````
<a name="postcompetitions"/>
##### POST '/competitions'
````json
POST '/competitions'
request
{
  "name": "Copa del Mundo Brasil 2014",
  "exact_match_points": 6,
  "result_match_points": 3,
  "no_match_points": 0,
  "no_forecast_points": 0,
  "start_date": "2014-03-31T19:27:42.242Z",
  "end_date": "2014-03-31T19:27:42.242Z"
}

response
{
  "id": 1,
  "name": "Copa del Mundo Brasil 2014",
  "exact_match_points": 6,
  "result_match_points": 3,
  "no_match_points": 0,
  "no_forecast_points": 0,
  "start_date": "2014-03-31",
  "end_date": "2014-03-31",
  "created_at": "2014-05-18T16:26:42.188Z",
  "updated_at": "2014-05-18T16:26:42.188Z"
}
````
