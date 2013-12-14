class Friend

  attr_reader :id

  def new(koala, id)
    @id    = id
    @koala = koala
  end

  def likes
    @likes ||= koala.get_connections(@id, 'likes')
  end

  def gift_keyword
    likes.shuffle.fetch('name')
  end

end
