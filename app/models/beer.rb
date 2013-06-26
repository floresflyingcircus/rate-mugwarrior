class Beer < ActiveRecord::Base
  has_many                :ratings
  has_many                :users,
                            through: :ratings
  belongs_to              :brewer
  delegate                :name,
                            to: :brewer,
                            prefix: true,
                            allow_nil: true
  validates_presence_of   :name
  validates_presence_of   :brewer_id
end
