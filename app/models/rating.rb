class Rating < ActiveRecord::Base
  belongs_to              :beer
  belongs_to              :user

  validates_presence_of   :user_id
  validates_presence_of   :beer_id
  validates 				      :rank, 
                            presence: true,
                            numericality: {
                              only_integer: true,
                              greater_than_or_equal_to: 1, 
                              less_than_or_equal_to: 5 }
end
