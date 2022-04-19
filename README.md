# TBN_OpenAPI
###### [last updated: 2022-04-19]
An non-official R function for downloading Taiwan Biodiversity Network (TBN) data through OpenAPI.
People could download filtered data into one data table.

非官方的 R function，利用OpenAPI下載台灣生物多樣性網絡 TBN openAPI 篩選符合查詢條件的資料，並彙整成一個檔案。
function內使用的關鍵字說明請參考TBN的API文件(https://www.tbn.org.tw/data/api/openapi/v25)

:exclamation: limit在function內預設為300，若要調整一頁的下載數量，要再自行修改function
:exclamation: "limit" is setted to 300, if people need to change limit number, modifing the function is required
## Usage
```R
TBN_download <- TBN_OpenAPI(...,version="v25",type="occurrence",limit=300)
```
Arguments | 完整說明可至TBN網站查看(https://www.tbn.org.tw/data/api/openapi/v25)
---|---
...     | 字串, 查詢參數，根據你所選的服務類型(type)，可以查詢的條件不同，條件間以"&"連接. ex: "eventPlaceAdminarea=南投&eventDate=2019~2021" 即可搜尋南投縣2019-2021年的TBN網站資料。
version | 字串, API的版本，預設為"v25"。
type    | 字串, 服務類型，分為三類："dataset", "species", "occurrence"，預設為"occurrence"。
limit   | 數字, 預設為300，至多為1000

## Value
<p>根據你選擇的服務類型，你將獲得 資料集清單、物種名錄、觀測資料。</p>
<p>According to the type you chose, a data.frame with TBN datasets/species list/occurrences is created.</p>
