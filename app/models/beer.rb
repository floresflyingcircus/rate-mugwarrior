class Beer < ActiveRecord::Base
  has_many                :ratings
  has_many                :users,
                            through: :ratings
  belongs_to              :brewer
  # delegate                :name,
  #                           to: :brewer,
  #                           prefix: true,
  #                           allow_nil: true
  validates_presence_of   :name
  validates_presence_of   :brewer_id



  # virtual attribute used instead of a delegate to support autocomplete functionality
  def brewer_name
    brewer.try(:name)
  end

  def brewer_name=(name)
    self.brewer = Brewer.find_or_create_by_name(name) if name.present?
  end

end
