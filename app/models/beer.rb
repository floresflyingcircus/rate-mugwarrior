class Beer < ActiveRecord::Base
  belongs_to              :brewer
  validates_presence_of   :name
  validates_presence_of   :brewer_id
end
