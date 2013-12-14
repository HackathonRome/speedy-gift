class LikeFilter

  def initialize(likes)
    @likes = likes
  end

  def sorting
    @sorted ||= @likes.sort_by { |l| l['talking_about_count'].to_i }
  end

  def sample
    tab = sorting.size > 10 ? sorting[-10..-1] : sorting
    tab.sample
  end

  def get_keyword
    sample.fetch('name', '')
  end

end
