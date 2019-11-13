---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, Python, and JavaScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/lord/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# User

## Get All Users

> 200 Response:

```json
{
    "data": [
        {
            "balance": [
                {
                    "id": "1",
                    "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
                    "symbol": "JOY",
                    "amount": "0.900000000000000000",
                    "locked_amount": "0.000000000000000000",
                    "staked_amount": "0.000000000000000000",
                    "created_at": "2019-11-12T08:44:47.000Z"
                },
                {
                    "id": "2",
                    "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
                    "symbol": "JUSD",
                    "amount": "0.000000000000000000",
                    "locked_amount": "0.000000000000000000",
                    "staked_amount": "0.000000000000000000",
                    "created_at": "2019-11-12T08:44:47.000Z"
                }
            ],
            "user": {
                "id": "1",
                "email": "deric@bodhi.network",
                "mobile": "1",
                "status": 1,
                "created_at": "2019-11-12T08:44:41.000Z"
            },
            "wallet": {
                "id": "1",
                "chain_id": 8899,
                "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
                "created_at": "2019-11-12T08:44:47.000Z"
            }
        },
        {...},
        {...}
    ]
}
```

This endpoint retrieves all users.

### HTTP Request

`GET http://example.com/v1/user`

### Query Parameters

Parameter | Example | Required | Description
--------- | ------- | -------- | -----------
email | my@email.com | false | Filter users with that email.
mobile | 123456789 | false | Filter users with that mobile number.

## Get A Specific User

> 200 Response:

```json
{
    "data": [
        {
            "balance": [
                {
                    "id": "1",
                    "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
                    "symbol": "JOY",
                    "amount": "0.900000000000000000",
                    "locked_amount": "0.000000000000000000",
                    "staked_amount": "0.000000000000000000",
                    "created_at": "2019-11-12T08:44:47.000Z"
                },
                {
                    "id": "2",
                    "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
                    "symbol": "JUSD",
                    "amount": "0.000000000000000000",
                    "locked_amount": "0.000000000000000000",
                    "staked_amount": "0.000000000000000000",
                    "created_at": "2019-11-12T08:44:47.000Z"
                }
            ],
            "user": {
                "id": "1",
                "email": "deric@bodhi.network",
                "mobile": "1",
                "status": 1,
                "created_at": "2019-11-12T08:44:41.000Z"
            },
            "wallet": {
                "id": "1",
                "chain_id": 8899,
                "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
                "created_at": "2019-11-12T08:44:47.000Z"
            }
        }
    ]
}
```

This endpoint retrieves a specific user.

### HTTP Request

`GET http://example.com/v1/user/<ID>`

### URL Parameters

Parameter | Example | Required | Description
--------- | ------- | -------- | -----------
ID | 1 | true | ID of the user to retrieve.

## Add A User

> 200 Response:

```json
{
    "data": "Success"
}
```

This endpoint creates a new user.

### HTTP Request

`POST http://example.com/v1/user`

### Body Parameters (JSON)

Parameter | Example | Required | Description
--------- | ------- | -------- | -----------
email | my@email.com | false | New user will be associated with this email.
mobile | 123456789 | false | New user will be associated with this mobile.
