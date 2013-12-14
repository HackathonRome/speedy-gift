class LikeFilter

  def initialize(likes)
    @likes = likes
  end

  def sorting
    @likes.sort_by { |l| l['talking_about_count'].to_i }
  end

  def get_keyword
    sorting[-10..-1].sample.fetch('name', '')
  end

end
