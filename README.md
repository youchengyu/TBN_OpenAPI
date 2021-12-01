# TBN_OpenAPI
R function for downloading Taiwan Biodiversity Network data through OpenAPI .

利用R語言下載TBN openAPI 符合查詢條件的資料，並彙整成一個檔案
function內使用的關鍵字說明請至下方連結
https://www.tbn.org.tw/data/api/openapi/v2

example: TBN_download <- TBN_openAPI(type="occurrence",version="v2"...)

## Usage
```r
TBN_OpenAPI(...,version="v2",type="occurrence")
```
## Arguments

* ...           查詢參數，條件以"&"連接. ex: "eventPlaceAdminarea=南投&eventDate=2019~2021" 搜尋南投縣2019~2021年的TBN網站資料。
* version       API的版本，預設為"v2".
* type          服務類型，預設為"occurrence".

## Details
