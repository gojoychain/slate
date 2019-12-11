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

Welcome to the Joy Plus API v1!

## Base URL

### Mainnet

[https://wallet.joy.plus/api/v1](https://wallet.joy.plus/api/v1)

### Testnet

[https://wallettest.joy.plus/api/v1](https://wallettest.joy.plus/api/v1)

# Authentication

## Session Cookie

The majority of the APIs are authenticated with a session cookie. The backend server will automatically create a session cookie for the user when they login at the Passport website. This cookie is automatically stored on the user's browser. The user is authenticated by this session cookie.

## API Key

Some APIs require an `API Key` header in the form of `Authorization: $API_KEY`. This is created through the [Create API Key](#create-api-key) endpoint. Also note that some endpoints require a `specific scope (permission)`. Admins can add the scope to an existing API Key.

## Admin API Key

Some APIs require an `Admin API Key` header in the form of `Authorization: $ADMIN_API_KEY`. See the administrator for getting that key.

# Auth

## SSO

> 200 Response:

```json
{
    "data": {
        "id": 1001483220,
        "address": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15"
    }
}
```

This endpoint authenticates with the Passport API and returns user info.

### HTTP Request

`GET /sso.html`

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
code | string | true | Code supplied by Passport API.

## User Info

> 200 Response:

```json
{
    "data": {
        "id": 1001483220,
        "address": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15"
    }
}
```

This endpoint returns user info.

### HTTP Request

`GET /user-info`

## Request SMS Verification Code

> 200 Response:

```json
{
    "data": {
        "message": "SMS sent"
    }
}
```

This endpoint requests an SMS verification code from the Passport API.

### HTTP Request

`POST /sms/request`

## Confirm SMS Verification Code

> 200 Response:

```json
{
    "data": {
        "ticket": "d93b5795027427482c9f4b89442e4724"
    }
}
```

This endpoint confirms an SMS verification code sent from the Passport API.

### HTTP Request

`POST /sms/confirm`

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
code | number | true | SMS verification code.

## Check Google Authenticator Enabled

> 200 Response:

```json
{
    "data": {
        "enabled": true
    }
}
```

This endpoint checks if the user has Google Authenticator enabled from the Passport API.

### HTTP Request

`POST /google/check`

## Request Google Authenticator QR Code

> 200 Response:

```json
{
    "data": {
        "secret": "1234567890ABCDEFGHIJK",
        "qrcode": "data:image/png;base64,ni2nf3nf02f3i1nfienfgh2498h291dnifb10hf31fh01fh31/183f1h3f801g3/f180h3f81hf3810efiqfn3nfi1nfi3nfof/feqnf891bf819bf1fb913bf"
    }
}
```

This endpoint requests a Google Authenticator QR Code (encoded as a Base64 image) and Secret from the Passport API. The QR Code should be scanned by the user on their Google Authenticator mobile app. The Secret should be written down and saved by the user.

### HTTP Request

`POST /google/request`

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
code | string | false | Existing Google Authenticator code

## Register Google Authenticator Device

> 200 Response:

```json
{
    "data": {
    }
}
```

This endpoint registers a Google Authenticator device. This endpoint should be called after [Request Google Authenticator QR Code](#request-google-authenticator-qr-code).

### HTTP Request

`POST /google/register`

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
secret | string | true | Google Authenticator secret
sms_code | string | true | SMS code received by Google. Either `sms_code` or `code` is required.
code | string | true | Google Authenticator code from mobile app. Either `sms_code` or `code` is required.

## Confirm Google Authenticator Code

> 200 Response:

```json
{
    "data": {
        "confirmed": true
    }
}
```

This endpoint confirms a Google Authenticator code.

### HTTP Request

`POST /google/confirm`

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
code | string | true | Google Authenticator code from mobile app

# API Key

## Create API Key

> 200 Response:

```json
{
    "data": {
        "apiKey": "xxx-xxx-xxx-xxx-xxx",
        "message": "Save this API Key. It will not be shown again."
    }
}
```

This endpoint creates a new API Key.

### HTTP Request

`POST /api-key`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires Admin Key.

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
email | string | true | Email address.

## Add/Remove Scope

> 200 Response:

```json
{
    "data": {
        "message": "Scope added: example_scope.create"
    }
}
{
    "data": {
        "message": "Scope removed: example_scope.create"
    }
}
```

This endpoint adds or removes a scope from an API Key. Some APIs require a specific scope (permission) tied to the API Key.

### HTTP Request

`PUT /api-key`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires Admin Key.

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
email | string | true | Email address.
scope_add | string | true | Scope to add. Either `scope_add` or `scope_remove` is required.
scope_remove | string | true | Scope to remove. Either `scope_add` or `scope_remove` is required.

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
                    "assetId": 1,
                    "assetName": "JOY Token",
                    "assetDecimals": 18,
                    "assetContractAddress": "0x0000000000000000000000000000000000000000",
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
                    "assetId": 2,
                    "assetName": "JUSD",
                    "assetDecimals": 18,
                    "assetContractAddress": "0x28d7fEecd1aB9Dae7d83cbB986f2A2Ecb127183d",
                    "assetUsdPrice": "0.000",
                    "assetIconUrl": ""
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

`GET /user`

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
                    "address": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
                    "symbol": "JOY",
                    "amount": "0.000000000000000000",
                    "lockedAmount": "0.000000000000000000",
                    "stakedAmount": "0.000000000000000000",
                    "createdAt": 1574308826000,
                    "assetId": 1,
                    "assetName": "JOY Token",
                    "assetDecimals": 18,
                    "assetContractAddress": "0x0000000000000000000000000000000000000000",
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
                    "assetId": 2,
                    "assetName": "JUSD",
                    "assetDecimals": 18,
                    "assetContractAddress": "0x28d7fEecd1aB9Dae7d83cbB986f2A2Ecb127183d",
                    "assetUsdPrice": "0.000",
                    "assetIconUrl": ""
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
        }
    ]
}
```

This endpoint retrieves a specific user.

### HTTP Request

`GET /user/<ID>`

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

`GET /wallet`

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

`GET /wallet/<ID>`

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
            "assetId": 1,
            "assetName": "JOY Token",
            "assetDecimals": 18,
            "assetContractAddress": "0x0000000000000000000000000000000000000000",
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
            "assetId": 2,
            "assetName": "JUSD",
            "assetDecimals": 18,
            "assetContractAddress": "0x28d7fEecd1aB9Dae7d83cbB986f2A2Ecb127183d",
            "assetUsdPrice": "0.000",
            "assetIconUrl": ""
        },
        {...}
    ]
}
```

This endpoint retrieves all balances.

### HTTP Request

`GET /balance`

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
            "address": "0xa31f8ddda5b55f13e5c3d2019144ceb5553ffc15",
            "symbol": "JOY",
            "amount": "0.000000000000000000",
            "lockedAmount": "0.000000000000000000",
            "stakedAmount": "0.000000000000000000",
            "createdAt": 1574308826000,
            "assetId": 1,
            "assetName": "JOY Token",
            "assetDecimals": 18,
            "assetContractAddress": "0x0000000000000000000000000000000000000000",
            "assetUsdPrice": "0.500",
            "assetIconUrl": ""
        }
    ]
}
```

This endpoint retrieves a specific balance.

### HTTP Request

`GET /balance/<ID>`

### URL Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
ID | int | true | ID of the balance to retrieve.

# Locked Balance

## Get All Locked Balances

> 200 Response:

```json
{
    "data": [
        {
            "id": "17",
            "balanceID": "1",
            "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
            "symbol": "JOY",
            "amount": "2.000000000000000000",
            "processed": 1,
            "expiresAt": 1575529620000,
            "createdAt": 1575557999000
        },
        {...}
    ]
}
```

This endpoint retrieves all locked balances.

### HTTP Request

`GET /locked-balance`

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | string | false | Filter by ID.
balance_id | string | false | Filter by Balance ID.
address | string | false | Filter by address (starts with 0x).
symbol | string | false | Filter by symbol.

## Get A Specific Locked Balance

> 200 Response:

```json
{
    "data": [
        {
            "id": "17",
            "balanceID": "1",
            "address": "0xabdc40732ef28a597a5431adc3e8d11f15f3609e",
            "symbol": "JOY",
            "amount": "2.000000000000000000",
            "processed": 1,
            "expiresAt": 1575529620000,
            "createdAt": 1575557999000
        }
    ]
}
```

This endpoint retrieves a specific locked balance.

### HTTP Request

`GET /balance/<ID>`

### URL Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
ID | int | true | ID of the locked balance to retrieve.

## Create A Locked Balance

> 200 Response:

```json
{
    "data": {
        "message": "LockedBalance 1 added"
    }
}
```

This endpoint creates a new locked balance.

### HTTP Request

`POST /locked-balance`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires API Key with scope `locked_balance.create`.

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
address | string | true | Wallet address (starts with 0x).
symbol | string | true | Token symbol.
amount | string | true | Amount to lock up (in decimal format).
expires_at | number | true | Date of expiration for the locked up amount (in UNIX milliseconds).

# Asset

## Get All Assets

> 200 Response:

```json
{
    "data": [
        {
            "id": 1,
            "name": "JOY Token",
            "symbol": "JOY",
            "decimals": 18,
            "contractAddress": "0x0000000000000000000000000000000000000000",
            "usdPrice": "0.500",
            "iconUrl": "",
            "createdAt": 1574666442000
        },
        {...}
    ]
}
```

This endpoint retrieves all assets.

### HTTP Request

`GET /asset`

### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
id | string | false | Filter by ID.
symbol | string | false | Filter by symbol.
decimals | string | false | Filter by decimals.

## Get A Specific Asset

> 200 Response:

```json
{
    "data": [
        {
            "id": 1,
            "name": "JOY Token",
            "symbol": "JOY",
            "decimals": 18,
            "contractAddress": "0x0000000000000000000000000000000000000000",
            "usdPrice": "0.500",
            "iconUrl": "",
            "createdAt": 1574666442000
        }
    ]
}
```

This endpoint retrieves a specific asset.

### HTTP Request

`GET /asset/<ID>`

### URL Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
ID | int | true | ID of the asset to retrieve.

## Create An Asset

> 200 Response:

```json
{
    "data": {
        "message": "Asset 1 added"
    }
}
```

This endpoint creates a new asset.

### HTTP Request

`POST /asset`

### Headers

Header | Required | Description
------ | -------- | -----------
Authorization | true | Requires Admin Key.

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
name | string | true | Name of the asset.
symbol | string | true | Symbol of the asset.
decimals | number | true | Decimals of the asset.
contract_address | string | true | Contract address of the asset.
usd_price | number | true | Current USD price of the asset.
icon_url | string | true | URL for the icon of the asset.

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

`GET /deposit`

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

`GET /deposit/<ID>`

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

`GET /withdraw`

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

`GET /withdraw/<ID>`

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

`GET /transaction`

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

`POST /withdraw-joy`

### Body Parameters (JSON)

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
from | string | true | Address to deduct the JOY from.
to | string | true | Address to send the JOY to.
value | string | true | Amount to withdraw. Should be decimal format, e.g. 1 JOY = "1".
