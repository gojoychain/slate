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
                    "address": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
                    "symbol": "JOY",
                    "amount": "0.000000000000000000",
                    "lockedAmount": "0.000000000000000000",
                    "stakedAmount": "0.000000000000000000",
                    "createdAt": 1574308826000,
                    "assetId": 7,
                    "assetName": "JOY Token",
                    "assetDecimals": 18,
                    "assetUsdPrice": "0.500",
                    "assetIconUrl": ""
                },
                {
                    "id": "2",
                    "address": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
                    "symbol": "JUSD",
                    "amount": "0.000000000000000000",
                    "lockedAmount": "0.000000000000000000",
                    "stakedAmount": "0.000000000000000000",
                    "createdAt": 1574308826000,
                    "assetId": null,
                    "assetName": null,
                    "assetDecimals": null,
                    "assetUsdPrice": null,
                    "assetIconUrl": null
                }
            ],
            "user": {
                "id": "1001483220",
                "openID": "abcdefghijklmnopqrstuvwxyz=",
                "firstName": "Deric",
                "lastName": "Walintukan",
                "email": "deric@bodhi.network",
                "mobile": "1234567890",
                "status": 1,
                "createdAt": 1574308826000
            },
            "wallet": {
                "id": "1001483220",
                "address": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
                "createdAt": 1574308826000
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
id | string | false | Filter by ID.
openid | string | false | Filter by OpenID.
first_name | string | false | Filter by first name.
last_name | string | false | Filter by last name.
email | string | false | Filter by email.
mobile | string | false | Filter by mobile number.

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
address | string | false | Filter by address (starts with 0x).

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
            "address": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
            "symbol": "JOY",
            "amount": "0.000000000000000000",
            "lockedAmount": "0.000000000000000000",
            "stakedAmount": "0.000000000000000000",
            "createdAt": 1574308826000,
            "assetId": 7,
            "assetName": "JOY Token",
            "assetDecimals": 18,
            "assetUsdPrice": "0.500",
            "assetIconUrl": ""
        },
        {
            "id": "2",
            "address": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
            "symbol": "JUSD",
            "amount": "0.000000000000000000",
            "lockedAmount": "0.000000000000000000",
            "stakedAmount": "0.000000000000000000",
            "createdAt": 1574308826000,
            "assetId": null,
            "assetName": null,
            "assetDecimals": null,
            "assetUsdPrice": null,
            "assetIconUrl": null
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
id | string | false | Filter by ID.
address | string | false | Filter by address (starts with 0x).
symbol | string | false | Filter by symbol. One of: [`JOY`, `JUSD`].

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

This endpoint retrieves a specific balance.

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

# Deposit

## Get All Deposits

> 200 Response:

```json
{
    "data": [
        {
            "id": "1",
            "txid": "0x562078adb2412f675fd63a944cf78b64b91084e83ff0052a1f66d107bde17ce5",
            "fromAddress": "0xd5d087daabc73fc6cc5d9c1131b93acbd53a2428",
            "toAddress": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
            "symbol": "JOY",
            "depositAmount": "1.000000000000000000",
            "createdAt": 1574408118000
        },
        {...}
    ]
}
```

This endpoint retrieves all deposits.

### HTTP Request

`GET http://example.com/v1/deposit`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
txid | string | false | Filter by txid (starts with 0x).
from_address | string | false | Filter by from address (starts with 0x).
to_address | string | false | Filter by to address (starts with 0x).
symbol | string | false | Filter by symbol. One of: [`JOY`, `JUSD`].

## Get A Specific Deposit

> 200 Response:

```json
{
    "data": [
        {
            "id": "1",
            "txid": "0x562078adb2412f675fd63a944cf78b64b91084e83ff0052a1f66d107bde17ce5",
            "fromAddress": "0xd5d087daabc73fc6cc5d9c1131b93acbd53a2428",
            "toAddress": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
            "symbol": "JOY",
            "depositAmount": "1.000000000000000000",
            "createdAt": 1574408118000
        }
    ]
}
```

This endpoint retrieves a specific deposit.

### HTTP Request

`GET http://example.com/v1/deposit/<ID>`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### URL Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
ID | int | true | ID of the deposit to retrieve.

# Withdraw

## Get All Withdraws

> 200 Response:

```json
{
    "data": [
        {
            "id": "1",
            "txid": "0xb272d68dd05c0ef8f73aecb9eef1c0ee71ed2b6261ccc869d82ed7bdf60fd2e5",
            "fromAddress": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
            "toAddress": "0xd5d087daabc73fc6cc5d9c1131b93acbd53a2428",
            "symbol": "JOY",
            "withdrawAmount": "2.000000000000000000",
            "createdAt": 1574408211000
        },
        {...}
    ]
}
```

This endpoint retrieves all withdraws.

### HTTP Request

`GET http://example.com/v1/withdraw`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
txid | string | false | Filter by txid (starts with 0x).
from_address | string | false | Filter by from address (starts with 0x).
to_address | string | false | Filter by to address (starts with 0x).
symbol | string | false | Filter by symbol. One of: [`JOY`, `JUSD`].

## Get A Specific Withdraw

> 200 Response:

```json
{
    "data": [
        {
            "id": "1",
            "txid": "0xb272d68dd05c0ef8f73aecb9eef1c0ee71ed2b6261ccc869d82ed7bdf60fd2e5",
            "fromAddress": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
            "toAddress": "0xd5d087daabc73fc6cc5d9c1131b93acbd53a2428",
            "symbol": "JOY",
            "withdrawAmount": "2.000000000000000000",
            "createdAt": 1574408211000
        }
    ]
}
```

This endpoint retrieves a specific withdraw.

### HTTP Request

`GET http://example.com/v1/withdraw/<ID>`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### URL Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
ID | int | true | ID of the withdraw to retrieve.

# Transaction

## Get All Transactions

> 200 Response:

```json
{
    "data": [
        {
            "id": "1",
            "txid": "0x562078adb2412f675fd63a944cf78b64b91084e83ff0052a1f66d107bde17ce5",
            "fromAddress": "0xd5d087daabc73fc6cc5d9c1131b93acbd53a2428",
            "toAddress": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
            "symbol": "JOY",
            "depositAmount": "1.000000000000000000",
            "withdrawAmount": null,
            "createdAt": 1574408118000
        },
        {
            "id": "1",
            "txid": "0xb272d68dd05c0ef8f73aecb9eef1c0ee71ed2b6261ccc869d82ed7bdf60fd2e5",
            "fromAddress": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
            "toAddress": "0xd5d087daabc73fc6cc5d9c1131b93acbd53a2428",
            "symbol": "JOY",
            "depositAmount": null,
            "withdrawAmount": "2.000000000000000000",
            "createdAt": 1574408211000
        }
    ]
}
```

This endpoint retrieves all deposits and withdraws.

### HTTP Request

`GET http://example.com/v1/transaction`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key.

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
address | string | false | Filters deposit's to_address and withdraw's from_address (starts with 0x).

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
