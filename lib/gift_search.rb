require 'nokogiri'

module GiftSearch
  class Base
    def initialize(query)
      @query = query
    end

    def noko
      @noko ||= Nokogiri::HTML(html)
    end

    def execute
      noko.css(list_selector).map do |product|
        begin
          extract_product_data(product)
        rescue
          Rails.logger.error $!.message
          next
        end
      end.flatten.compact
    end
  end
end
