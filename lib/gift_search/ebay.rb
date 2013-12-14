require_relative '../gift_search'

module GiftSearch
  class Ebay < Base
    
    def execute

        uri = URI(getUrl)
        req = Net::HTTP::Get.new(uri)
        res = Net::HTTP.start(uri.hostname, uri.port) {|http|
          http.request(req)
        }
        return res.body
        
    end

    def getUrl

        auth_token = 'AgAAAA**AQAAAA**aAAAAA**QXmsUg**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wFk4GhC5aGpQydj6x9nY+seQ**g3UCAA**AAMAAA**5uvIkrDrS+t6BrnfcFvoilmbTeqGMwinaK4dBu2f38Fum526zmAEkd18DqNitSQyAAYhhxxjVstgdBkkksp31jpb2zorYFte8sDHuDlJ4PsRMwHU+1Xprw5jpuqsD3h2vCcFGk+8URUDhR0KYMTLuYb+Mog+dQqaZHepwME+qkHZK0swPvGQISDqfwBXFQSu9Bz8XH5O8C605QqDtQC/Ax/Xsp52sdgtLYZKxXt5XVWNsR3OJLJbmmwBhka49V7UWw5qByc36n8Y7e5trYsW5o4kSzO2DYkOaELdkAzhbCf6Y/iisLSONkDaYiy0VR4YGqrgs4A4byxwXt6bbkhuX0a7PdMDjuu4zGJZWEw7DGHownsomnD8dgs+xT1mvp1WkUiqS2/clcfh+PN0sigLFozY/LyutrWhIpcoAbHzzHpN6iSv/IKgb0nSkku1YeXNrK2Hg7GUi/TF15/W8BiWSu9ybepCwp/3cRVvlKMrwjCDgPBR3XSmJ+ZTL17kmfE0dKYDQ1SGCsXQxZRXulAgJsUOR4ioAK73UGKSPer3foIOgMLZhUveUB2vuhce1FQNYfRMd+rtvPV0Vn2sbCvpaR3Xuolx+ISMwYdto9UV8slqlxRQN8QzRsbCwLsAFngnvhR8qtt+IEd6QlWlBs7n500ETzAEMeeo0k1jMceQioAvtpMzQ73uBCq1Va3zT1Z5USP+urFEgY1THzJa2qwRUVuaANf92hYti9qOYSp4jJAEqo4COg6XrgPPU+f+rc+r'
        dev_id = 'caf5a5b7-245d-48c4-93ac-18665cdf4a01'
        app_id = 'Webmonks-93c3-43f2-9c76-e5e2484960dd'
        cert = 'ea8f8eea-a051-47af-a7be-76b2abf628d9'
      
        sandbox = true
        
        version = '1.0.0'
        appid = 'Webmonks-93c3-43f2-9c76-e5e2484960dd'
        globalid = 'EBAY-IT'
        query = 'harry potter'
        safequery = URI::encode(query)
        
        endpoint = 'http://svcs.ebay.com/services/search/FindingService/v1' 
        params = ["OPERATION-NAME=findItemsByKeywords", "SERVICE-VERSION=#{version}", "SECURITY-APPNAME=#{appid}", "GLOBAL-ID=#{globalid}","keywords=#{safequery}","paginationInput.entriesPerPage=3"]    
    
        endpoint  + "?" + params.join("&")

    end
    
  end
end
