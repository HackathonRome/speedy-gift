require_relative '../gift_search'

module GiftSearch
  class Amazon < Base
    def execute
      noko.css('#rightResultsATF .prod').map do |product|
        extract_product_data(product)
      end
    end

    def extract_product_data(node)
      {
        image_url: node.css('.image a img').attr('src').value,
        url: node.css('.newaps a').attr('href').value,
        title: node.css('.newaps a span').text,
        price: price_for_node(node),
        source: :amazon,
        currency: :dollar
      }
    end

    def price_for_node(node)
      node.css('.digp a, .newp a').map do |e|
        e.text.scan(/((\d+)\.(\d+))/).flatten.first.to_f
      end.flatten.compact.min
    end

    def html
      @html ||= %x[
curl 'http://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=#{@query}' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Host: www.amazon.com' -H 'Accept-Language: pl,en-US;q=0.8,en;q=0.6,de-AT;q=0.4,de;q=0.2' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/30.0.1599.114 Chrome/30.0.1599.114 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Cookie: x-wl-uid=1aItXx3sN2hs+UCYjIEl4+kRuCD/K2sqrIrMzHv1HWOaiXs4PsdCDdO8OINnR790l/tVdQHBle7a9rQPXVgI2GA==; _mkto_trk=id:893-KVA-919&token:_mch-amazon.com-1378421707863-84245; s_pers=%20s_vnum%3D1381945898970%2526vn%253D1%7C1381945898970%3B%20s_invisit%3Dtrue%7C1379355701440%3B%20s_nr%3D1379353901443-New%7C1387129901443%3B; aws-session-id-time=2082758401l; aws-session-id=176-2328990-6341315; aws-ubid-main=184-9652231-4639625; aws-x-main=I2T4yphdJ16BbI436wsEmcnJofI8s03h; __utmv=194891197.I2T4yphdJ16BbI436wsEmcnJofI8s03h; __utma=194891197.161964515.1374239770.1386107392.1387014284.26; __utmc=194891197; __utmz=194891197.1387014284.26.18.utmccn=(referral)|utmcsr=google.pl|utmcct=/|utmcmd=referral; aws_lang=en; session-token=1lFjG9q/dMhzIJGMonnOyG5+UFQjRnKlmVT/aqwTIxk+6jk+gei+uW5PBfkGOn1GRHLiyYvBbqFRDf2gJ1dWxx1S7mEFeDY+YDdKOMYRglEYOzlBXesx7ywbXdsZU2PvyoVdLNKlFEt0sIdYTwXRIlsZ90YG2JWuntJY1EVlcYHHX5k6uij1Dr79lsgTVV0f1jTB9LZJri3M2xJvs80jfKGSF6mznFLVdci3g+poAlV9Z1w74tTDUsuuQK11hzG5; csm-hit=351.64|1387017099021; ubid-main=191-6635666-4743328; session-id-time=2082787201l; session-id=179-1754817-6532225' -H 'Connection: keep-alive' --compressed
      ]
    end
  end
end
