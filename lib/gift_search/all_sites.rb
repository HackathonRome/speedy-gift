require 'parallel'
require_relative 'amazon'
require_relative 'gifts_com'

module GiftSearch
  class AllSites < Base
    def execute
      searches = self.searches

      Parallel.map(searches, in_threads: searches.count, &:execute).flatten
    end

    def searches
      [Amazon, GiftsCom].map { |klass| klass.new(@query) }
    end
  end
end
