require_relative '../gift_search'

module GiftSearch
  class GiftsCom < Base
    def list_selector
      '#srpProd li'
    end

    def extract_product_data(node)
      {
        image_url: node.css('.prodCont img').attr('src').value,
        url: 'http://gifts.com' + node.css('.prodCont a').attr('href').value,
        title: node.css('.prodName a').text,
        price: node.css('.priceField a').text.split(' at ').first.to_f,
        source: :gifts_com,
        currency: :dollar
      }
    end

    def html
      @html ||= %x[
        curl 'http://www.gifts.com/find?keyword=#{@query}' -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip,deflate,sdch' -H 'Host: www.gifts.com' -H 'Accept-Language: pl,en-US;q=0.8,en;q=0.6,de-AT;q=0.4,de;q=0.2' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/30.0.1599.114 Chrome/30.0.1599.114 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cookie: JSESSIONID=AAFF0530E73477B1240F62087191AEFB; mv_test=0.7048000165873823; visitor_id=4HPU5E0G1QJLVGPHLUJB; visits=:7GWTDSM0UADQ6THFR9UW; SERVERID=web04; keyword=iphone; session_info=4HPU5E0G1QJLVGPHLUJB; vcco=3; non_hp_cook=googs; filtercookiekeyword=no' -H 'Connection: keep-alive' -H 'Cache-Control: no-cache' --compressed

      ]
    end
  end
end
