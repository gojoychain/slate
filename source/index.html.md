---
title: API Reference

# language_tabs: # must be one of https://git.io/vQNgJ
#   - shell
#   - ruby
#   - python
#   - javascript

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  # - errors

search: true
---

# Introduction

Welcome to the Joy Plus API!

# Authentication

**[Register for an API Key](#generate-api-key)**

An API key is needed to allow access to the APIs. API keys should be included in all API requests to the server in a header that looks like the following:

`Authorization: MY_API_KEY`

<aside class="notice">
You must replace <code>MY_API_KEY</code> with your personal API key.
</aside>

# Auth

## Generate API Key

> 200 Response:

```json
{
    "data": {
        "apiKey": "your-new-api-key",
        "message": "Save this API Key. It will not be shown again."
    }
}
```

This endpoint creates a new API Key.

<aside class="warning">
Save your API Key as you will not be able to retrieve it again!
</aside>

### HTTP Request

`POST http://example.com/v1/register`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires Admin Key.

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
email | string | true | Email to register the API Key with.

## Login

> 200 Response:

```json
{
    "data": [
        {
            "balance": [
                {
                    "id": "1",
                    "address": "0x0000000000000000000000000000000000000000",
                    "symbol": "JOY",
                    "amount": "0.000000000000000000",
                    "lockedAmount": "0.000000000000000000",
                    "stakedAmount": "0.000000000000000000",
                    "createdAt": 1574316887000
                },
                {
                    "id": "2",
                    "address": "0x0000000000000000000000000000000000000000",
                    "symbol": "JUSD",
                    "amount": "0.000000000000000000",
                    "lockedAmount": "0.000000000000000000",
                    "stakedAmount": "0.000000000000000000",
                    "createdAt": 1574316887000
                }
            ],
            "user": {
                "id": "1000000000",
                "openID": "abcdefghijklmnopqrstuvwxyz=",
                "firstName": "John",
                "lastName": "Doe",
                "email": "john.doe@gmail.com",
                "mobile": "1234567890",
                "status": 1,
                "createdAt": 1574316887000
            },
            "wallet": {
                "id": "1000000000",
                "address": "0x0000000000000000000000000000000000000000",
                "createdAt": 1574316887000
            }
        }
    ]
}
```

This endpoint authenticates with the Passport API and returns user info.

### HTTP Request

`POST http://example.com/v1/login`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
code | string | true | Code supplied by Passport API.

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
                    "address": "0x0000000000000000000000000000000000000000",
                    "symbol": "JOY",
                    "amount": "0.000000000000000000",
                    "lockedAmount": "0.000000000000000000",
                    "stakedAmount": "0.000000000000000000",
                    "createdAt": 1574316887000
                },
                {
                    "id": "2",
                    "address": "0x0000000000000000000000000000000000000000",
                    "symbol": "JUSD",
                    "amount": "0.000000000000000000",
                    "lockedAmount": "0.000000000000000000",
                    "stakedAmount": "0.000000000000000000",
                    "createdAt": 1574316887000
                }
            ],
            "user": {
                "id": "1000000000",
                "openID": "abcdefghijklmnopqrstuvwxyz=",
                "firstName": "John",
                "lastName": "Doe",
                "email": "john.doe@gmail.com",
                "mobile": "1234567890",
                "status": 1,
                "createdAt": 1574316887000
            },
            "wallet": {
                "id": "1000000000",
                "address": "0x0000000000000000000000000000000000000000",
                "createdAt": 1574316887000
            }
        },
        {...}
    ]
}
```

This endpoint retrieves all users.

### HTTP Request

`GET http://example.com/v1/user`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
openid | string | false | Filter users with that OpenID.
first_name | string | false | Filter users with that first name.
last_name | string | false | Filter users with that last name.
email | string | false | Filter users with that email.
mobile | string | false | Filter users with that mobile number.

## Get A Specific User

> 200 Response:

```json
{
    "data": [
        {
            "balance": [
                {
                    "id": "1",
                    "address": "0x0000000000000000000000000000000000000000",
                    "symbol": "JOY",
                    "amount": "0.000000000000000000",
                    "lockedAmount": "0.000000000000000000",
                    "stakedAmount": "0.000000000000000000",
                    "createdAt": 1574316887000
                },
                {
                    "id": "2",
                    "address": "0x0000000000000000000000000000000000000000",
                    "symbol": "JUSD",
                    "amount": "0.000000000000000000",
                    "lockedAmount": "0.000000000000000000",
                    "stakedAmount": "0.000000000000000000",
                    "createdAt": 1574316887000
                }
            ],
            "user": {
                "id": "1000000000",
                "openID": "abcdefghijklmnopqrstuvwxyz=",
                "firstName": "John",
                "lastName": "Doe",
                "email": "john.doe@gmail.com",
                "mobile": "1234567890",
                "status": 1,
                "createdAt": 1574316887000
            },
            "wallet": {
                "id": "1000000000",
                "address": "0x0000000000000000000000000000000000000000",
                "createdAt": 1574316887000
            }
        }
    ]
}
```

This endpoint retrieves a specific user.

### HTTP Request

`GET http://example.com/v1/user/<ID>`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### URL Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
ID | int | true | ID of the user to retrieve.

# Wallet

## Get All Wallets

> 200 Response:

```json
{
    "data": [
        {
            "id": "1000000000",
            "address": "0x0000000000000000000000000000000000000000",
            "createdAt": 1574316887000
        },
        {...}
    ]
}
```

This endpoint retrieves all wallets.

### HTTP Request

`GET http://example.com/v1/wallet`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
address | string | false | Filter wallets with that address (starts with 0x).

## Get A Specific Wallet

> 200 Response:

```json
{
    "data": [
        {
            "id": "1000000000",
            "address": "0x0000000000000000000000000000000000000000",
            "createdAt": 1574316887000
        }
    ]
}
```

This endpoint retrieves a specific wallet.

### HTTP Request

`GET http://example.com/v1/wallet/<ID>`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### URL Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
ID | int | true | ID of the wallet to retrieve.

# Balance

## Get All Balances

> 200 Response:

```json
{
    "data": [
        {
            "id": "1",
            "address": "0x0000000000000000000000000000000000000000",
            "symbol": "JOY",
            "amount": "0.000000000000000000",
            "lockedAmount": "0.000000000000000000",
            "stakedAmount": "0.000000000000000000",
            "createdAt": 1574316887000
        },
        {
            "id": "2",
            "address": "0x0000000000000000000000000000000000000000",
            "symbol": "JUSD",
            "amount": "0.000000000000000000",
            "lockedAmount": "0.000000000000000000",
            "stakedAmount": "0.000000000000000000",
            "createdAt": 1574316887000
        },
        {...}
    ]
}
```

This endpoint retrieves all balances.

### HTTP Request

`GET http://example.com/v1/balance`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
address | string | false | Filter balances with that address (starts with 0x).
symbol | string | false | Filter wallets with that symbol. One of: [`JOY`, `JUSD`].

## Get A Specific Balance

> 200 Response:

```json
{
    "data": [
        {
            "id": "1",
            "address": "0x0000000000000000000000000000000000000000",
            "symbol": "JOY",
            "amount": "0.000000000000000000",
            "lockedAmount": "0.000000000000000000",
            "stakedAmount": "0.000000000000000000",
            "createdAt": 1574316887000
        }
    ]
}
```

This endpoint retrieves a specific wallet.

### HTTP Request

`GET http://example.com/v1/balance/<ID>`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### URL Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
ID | int | true | ID of the balance to retrieve.

# Action

## Withdraw JOY

> 200 Response:

```json
{
    "data": {
        "txid": "0x5e134ef200ba6a87e9d7d5ce049011ca0b8def6acc0a35cbc71df552f6d26d48"
    }
}
```

This endpoint withdraws JOY from the admin account and deducts the `value` from the `from` address.

### HTTP Request

`POST http://example.com/v1/withdraw-joy`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
from | string | true | Address to deduct the JOY from.
to | string | true | Address to send the JOY to.
value | string | true | Amount to withdraw. Should be decimal format, e.g. 1 JOY = "1".
