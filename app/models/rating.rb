class Rating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user

  validates_presence_of   :user_id
  validates_presence_of   :beer_id
end
