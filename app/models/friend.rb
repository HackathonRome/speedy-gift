class Friend

  attr_reader :id

  def initialize(koala, id)
    @id    = id
    @koala = koala
  end

  def likes
    @likes ||= @koala.get_connections(@id, 'likes')
  end

  def gift_keyword
    prepare_keyword(likes.sample)
  end

  private

    def prepare_keyword(like)
      return nil unless like.present?

      keyword = [like['name'], like['category']].join(' ')
      keyword.gsub!(/[^[:alpha:]]+/, ' ')
    end

end
