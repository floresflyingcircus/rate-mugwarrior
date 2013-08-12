class BeerPresenter < BasePresenter
  presents :beer
  delegate :name, to: :beer
  delegate :brewery_name, to: :beer

  def submitted
    beer.created_at.strftime("%B %d %Y")
  end

  def rating
  	content_tag("div", beer.average_rating)
  end

  def avatar
	image_tag beer.avatar.url(:medium)
  end
end