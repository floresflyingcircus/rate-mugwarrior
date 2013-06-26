class BeerPresenter < BasePresenter
  presents :beer
  delegate :name, to: :beer
  delegate :brewer_name, to: :beer

  def submitted
    beer.created_at.strftime("%B %d %Y")
  end

  def rating
    "BEER RATING"
  end
end