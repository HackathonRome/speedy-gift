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
    like = likes.sample

    keyword = ""
    keyword << like['name']
    keyword << " "
    keyword << like['category']
    keyword.gsub!(/[^[:alpha:]]+/, " ")
    keyword
  end
end
