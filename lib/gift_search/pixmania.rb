require_relative '../gift_search'

module GiftSearch
  class Pixmania < Base
    def execute
      noko.css('.resultList article').map do |product|
        extract_product_data(product)
      end
    end

    def extract_product_data(node)
      {
        image_url: node.css('.imgC .image').attr('src').value,
        url: node.css('.desc .productTitle a').attr('href').value,
        title: node.css('.desc .productTitle a').text,
        price: node.css('.currentPrice').text.scan(/((\d+),(\d+))/).flatten.first.to_f,
        source: :pixmania,
        currency: :euro
      }
    end

    def escaped_query
      @query.gsub(/[^[:alnum:]]+/, '-')
    end

    def html
      @html ||= %x[
        curl 'http://www.pixmania.it/search/#{escaped_query}.html' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Host: www.pixmania.it' -H 'Accept-Language: pl,en-US;q=0.8,en;q=0.6,de-AT;q=0.4,de;q=0.2' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/30.0.1599.114 Chrome/30.0.1599.114 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: http://www.pixmania.it/index.html' -H 'Cookie: sCountryCode=it; sLanguageCode=it; etuid=Zk4zlmxjNKyURCf_l4BVyA--; m_ses=20131214104532; sthc=b424.1705.1387018048693.iphone%2Bgsm%2B3gb; psthc=b424.1705.1387018048693.iphone%2Bgsm%2B3gb; cookieSource2=a%3A1%3A%7Bi%3A0%3Ba%3A9%3A%7Bs%3A2%3A%22DF%22%3Bi%3A1389606331%3Bs%3A2%3A%22LS%22%3Bd%3A2662223102%3Bs%3A7%3A%22MCTAGID%22%3Bi%3A-1%3Bs%3A5%3A%22SRCID%22%3Bi%3A305%3Bs%3A7%3A%22TAGCMDE%22%3Bi%3A-1%3Bs%3A5%3A%22IDTID%22%3Bi%3A-1%3Bs%3A2%3A%22DD%22%3Bi%3A1387014331%3Bs%3A3%3A%22PKL%22%3Bd%3A2662580970%3Bs%3A3%3A%22FKL%22%3Bd%3A2662223102%3B%7D%7D; uc=d399bbb2-cf30-443e-8113-8a50bc516d06; m=1; n=1; s=b23117137.23117137; mvtid=424%253A0%253A1387028271363; m_cnt=6; PHPSESSID=506a9e667af33fb0153569057f226203' -H 'Connection: keep-alive' -H 'Cache-Control: no-cache' --compressed
      ]
    end
  end
end
