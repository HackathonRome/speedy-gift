require_relative '../gift_search'

module GiftSearch
  class Gyft < Base

    def execute
        timestamp = Time.now.getutc.to_i.to_s
        uri = URI(getUrl(timestamp))
        req = Net::HTTP::Get.new(uri)
        req['x-sig-timestamp'] = timestamp
        res = Net::HTTP.start(uri.hostname, uri.port) {|http|
          http.request(req)
        }
        return res.body
        
    end

    def getUrl(timestamp)

        apiKey = '9myn4updk8rwav5p8fpht4mz'
        apiSecret = 'dZHET6UtMg'    
        stringToSign = apiKey + apiSecret + timestamp
        sha256 = Digest::SHA256.new
        signature = sha256.hexdigest(stringToSign)
        "http://sandbox.gyft.com/v1/reseller/shop_cards?api_key=%s&sig=%s" % [apiKey, signature]

    end
    
  end
end
