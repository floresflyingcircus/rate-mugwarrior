class Beer < ActiveRecord::Base
  has_many      :ratings
  has_many      :users,
                  through: :ratings

  belongs_to    :brewery

  validates     :name,
                  presence: true,
                  uniqueness: true
  validates     :brewery_id,
                  presence: true



  # virtual attribute used instead of a delegate to support autocomplete functionality
  def self.not_rated_yet_by(user)
    where("id not in (" + Rating.where("user_id = ?", user.id).pluck(:beer_id).join(", ") +")")
  end

  def self.find_random_unranked_beer_for(user)
    beers = Beer.not_rated_yet_by(user)

    if beers.size > 0
      return beers.sample
    else
      return false
    end
  end

  def brewery_name
    brewery.try(:name)
  end

  def brewery_name=(name)
    self.brewery = Brewery.find_or_create_by_name(name) if name.present?
  end
  def average_rating
    self.ratings.average(:rank).to_i
  end


end
