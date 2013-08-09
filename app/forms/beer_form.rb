class BeerForm
  # Rails 4: include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  def persisted?
    false
  end

  delegate :name, :brewery_name, to: :beer
  delegate :rank, to: :rating

  def beer
    @beer ||= Beer.new
  end

  def rating
    @rating ||= beer.ratings.new
  end

  def submit(params)
    beer.attributes = params.slice(:name, :brewery_name).permit(:name, :brewery_name)
    rating.attributes = params.slice(:rank).permit(:rank)
  end

end