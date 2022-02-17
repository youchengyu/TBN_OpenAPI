# TBN_OpenAPI
An non-official R function for downloading Taiwan Biodiversity Network (TBN) data through OpenAPI.
People could filter and download data into one CSV table.

利用R語言下載TBN openAPI 篩選符合查詢條件的資料，並彙整成一個檔案(非官方)
function內使用的關鍵字說明請參考TBN的API文件(https://www.tbn.org.tw/data/api/openapi/v2)

:exclamation: 資料量可能比想像中的多，強烈建議加上"limit=20"來避免電腦負荷過高

## Usage
```R
TBN_download <- TBN_OpenAPI(...,version="v2",type="occurrence")
```
Arguments | -- 
---|---
...     | 字串, 查詢參數，根據你所選的服務類型(type)，可以查詢的條件不同，條件間以"&"連接. ex: `"eventPlaceAdminarea=南投&eventDate=2019~2021"` 即可搜尋南投縣2019~2021年的TBN網站資料。TBN網站上有完整的說明https://www.tbn.org.tw/data/api/openapi/v2
version | 字串, API的版本，預設為"v2"。
type    | 字串, 服務類型，分為三類："dataset", "species", "occurrence"，預設為"occurrence"。

## Value
根據你選擇麼服務類型，你將獲得 資料集清單、物種名錄、觀測資料。
According to the type you chose, a data.frame with TBN datasets/species list/occurrences is created.
