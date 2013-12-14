class Friend

  attr_reader :id

  def initialize(koala, id)
    @id    = id
    @koala = koala
  end

  def likes
    @likes ||= request
  end

  def request
    data = @koala.get_connections(@id, '?fields=id,name,likes.limit(100).fields(talking_about_count,name,likes)')
    data.fetch('likes').fetch('data')
  end

  def gift_keyword
    filter = LikeFilter.new(likes)
    filter.get_keyword
  end

end
