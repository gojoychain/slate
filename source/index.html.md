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

API keys are needed to allow access to the authenticated APIs. API keys should be included in all API requests to the server in a header that looks like the following:

`Authorization: MY_API_KEY`

<aside class="notice">
You must replace <code>MY_API_KEY</code> with your personal API key.
</aside>

# Register

## Generate API Key

> 200 Response:

```json
{
    "data": {
        "api_key": "your-new-api-key",
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

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### URL Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
ID | int | true | ID of the user to retrieve.

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

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
email | string | false | Email for this new user.
mobile | string | false | Mobile number for this new user.

# Wallet

## Get All Wallets

> 200 Response:

```json
{
    "data": [
        {
            "wallet": {
                "id": "1",
                "chain_id": 8899,
                "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
                "created_at": "2019-11-12T08:44:47.000Z"
            }
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
chain_id | int | false | Filter wallets with that chain ID.

## Get A Specific Wallet

> 200 Response:

```json
{
    "data": [
        {
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

## Add A Wallet

> 200 Response:

```json
{
    "data": "Success"
}
```

This endpoint creates a new wallet. When a new wallet is created, two balance rows (`JOY` and `JUSD`) will automatically be created for that new wallet.

### HTTP Request

`POST http://example.com/v1/wallet`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | int | true | User ID to assign this new wallet to.
address | string | true | Address for this new wallet.
chainId | int | true | Chain ID for this new wallet.

# Balance

## Get All Balances

> 200 Response:

```json
{
    "data": [
        {
            "balance": {
                "id": "1",
                "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
                "symbol": "JOY",
                "amount": "0.900000000000000000",
                "locked_amount": "0.000000000000000000",
                "staked_amount": "0.000000000000000000",
                "created_at": "2019-11-12T08:44:47.000Z"
            }
        },
        {
            "balance": {
                "id": "2",
                "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
                "symbol": "JUSD",
                "amount": "0.000000000000000000",
                "locked_amount": "0.000000000000000000",
                "staked_amount": "0.000000000000000000",
                "created_at": "2019-11-12T08:44:47.000Z"
            }
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
            "balance": {
                "id": "1",
                "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
                "symbol": "JOY",
                "amount": "0.900000000000000000",
                "locked_amount": "0.000000000000000000",
                "staked_amount": "0.000000000000000000",
                "created_at": "2019-11-12T08:44:47.000Z"
            }
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
