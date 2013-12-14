require 'parallel'
require_relative 'amazon'
require_relative 'gifts_com'

module GiftSearch
  class AllSites < Base
    def execute
      searches = self.searches

      results = Parallel.map(searches, in_threads: searches.count, &:execute)

      # this is done to ensure stuff from various sources get a chance to be visible
      zipped = results[0].zip(*results[1..-1])

      zipped.flatten.compact
    end

    def searches
      [Amazon, GiftsCom].map { |klass| klass.new(@query) }
    end
  end
end
