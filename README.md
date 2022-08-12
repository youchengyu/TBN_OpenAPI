# TBN_OpenAPI
###### [last updated: 2022-08-12]
An unofficial R function for downloading Taiwan Biodiversity Network (TBN) data through OpenAPI.
People could download filtered data into a data table.

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
type    | 字串, 服務類型，分為三類："occurrence", "taxon","dataset" ，預設為"occurrence"。
limit   | 數字, 預設為300，至多為1000

## Value
根據你選擇的服務類型，你將獲得**觀測紀錄occurrence**、**物種名錄taxon**、**資料集清單dataset**。
<p>According to the type you chose, a data.frame with TBN occurrences/taxon list/datasets is created.</p>

### 觀測紀錄occurrence
```R
occurrences <- TBN_OpenAPI(type="occurrence", "datasetUUID=","86714dd0-3c06-4d80-b8fd-3b92eec4e181","&boundedBy=120.84%2023.85%2C120.76%2023.81")
occurrences
```
|occurrenceID|modified|originalVernacularName|basisOfRecord|externalID|...|
|---|---|---|---|---|---|
|515a8e72-d0f7-47c3-8f5f-aa449afb686d|2022-08-04 01:32|Prunus zippeliana Miq.|保存標本|55161|...|
|f797d49a-efbe-49cb-b15c-29b9389b7680|2022-08-04 01:32|Quercus glauca Thunb.|保存標本|55312|...|
|873dc22c-b3dd-4fb8-8a61-59d6ef57b7e1|2022-08-04 01:32|Quercus gilva Blume|保存標本|55313|...|
...

### 物種名錄taxon
```R
taxon <- TBN_OpenAPI(type= "taxon","name=麻雀")
taxon
```
|taxonUUID                           |parentUUID                                                      |taxonName|...|
|---|---|---|---|
|1eda1fcc-84c0-4065-a530-71d362fb6b30| 18d524d4-ac32-4db7-b59f-e008efb3b52a                                              |麻雀科 Passeridae|...|
|c1975a33-1bd1-4b3b-8e53-a7be6a74852a| 1eda1fcc-84c0-4065-a530-71d362fb6b30                                           |麻雀屬 <i>Passer</i>|...|
|142588d6-3ebb-40d6-8fa7-148236953ac5| c1975a33-1bd1-4b3b-8e53-a7be6a74852a                                |家麻雀 <i>Passer domesticus</i>|...|
...

### 資料集清單dataset
```R
datasets <- TBN_OpenAPI(type= "dataset","name=taie")
datasets
```
|datasetName|                      datasetTaxonGroup|              datasetLicense| datasetPublisher|
|---|---|---|---|
|臺灣特有生物研究保育中心植物標本館(TAIE)苔蘚資料|               真菌類、其他無脊椎、苔蘚| 政府資料開放授權條款－第1版|         特生中心|
|特有生物研究保育中心植物標本館資料集 (TAIE)| 苔蘚、石松類、裸子植物、蕨類、被子植物| 政府資料開放授權條款－第1版|         特生中心|
