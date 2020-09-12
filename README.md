
# AWS Managed Blockchain Lambda Client Implementation

## Setup an AWS Managed Blockchain Service

## Following packages should be available
* AWS CLI
* AWS Serverless Application Model CLI
* Java 8
* Gradle
* Install Asset smart contract as shown in my previous sample

## Execute following command to make all scripts executable

```bash
find ~/aws-bc-lambda/ -type f -iname "*.sh" -exec chmod +x {} \;
```

## Build the Classes

```bash
sam build
```

## Deploy Lambda Function

```bash
./deployLambda.sh
```

## Execute REST APIs

### Register/enroll a user
```bash
curl -s -X POST "${API_URL}/enroll-lambda-user"
```

### Create an Asset

```bash
curl -s -X POST "${API_URL}/assets" -H "Content-Type: application/json" -d '{"assetOwnerName":"Susmit","email":"susmit@bcasset.com","assetName": "CAR 501","assetId": "501","assetType": "car", "registeredDate":"2018-10-22T11:52:20.182Z","docType":"asset"}'
```

### Query an Asset

```bash
curl -s -X GET "${API_URL}/assets/CAR201"
```
