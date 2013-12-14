class Friend

  attr_reader :id

  def initialize(koala, id)
    @id    = id
    @koala = koala
  end

  def full_name
    request.fetch('name')
  end

  def likes
    @likes ||= request.fetch('likes', {}).fetch('data', nil)
  end

  def request
    @data ||= @koala.get_connections(@id, '?fields=id,name,likes.limit(100).fields(talking_about_count,name,likes)')
  end

  def gift_keyword
    return nil if likes.nil?

    filter = LikeFilter.new(likes)
    filter.get_keyword
  end

end
