# TBN_OpenAPI
R function for downloading Taiwan Biodiversity Network data through OpenAPI .

利用R下載TBN openAPI的資料
function內使用的關鍵字說明請至下方連結
https://www.tbn.org.tw/data/api/openapi/v2

example: TBN_openAPI(type="occurrence",version="v2"...)

## Usage
```r
TBN_OpenAPI(...,version="v2",type="occurrence")
```
## Arguments

* ...           查詢參數，條件以"&"連接.
* version       API的版本，預設為"v2".
* type          服務類型，預設為"occurrence".

## Details
