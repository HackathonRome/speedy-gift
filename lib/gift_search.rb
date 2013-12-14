require 'nokogiri'

module GiftSearch
  class Base
    def initialize(query)
      @query = query
    end

    def noko
      @noko ||= Nokogiri::HTML(html)
    end
  end
end
