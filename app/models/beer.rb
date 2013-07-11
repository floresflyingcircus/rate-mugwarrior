class Beer < ActiveRecord::Base
  has_many      :ratings
  has_many      :users,
                  through: :ratings

  belongs_to    :brewery

  validates     :name,
                  presence: true
  validates     :brewery_id,
                  presence: true

  # virtual attribute used instead of a delegate to support autocomplete functionality
  def brewery_name
    brewery.try(:name)
  end

  def brewery_name=(name)
    self.brewery = Brewery.find_or_create_by_name(name) if name.present?
  end
end
