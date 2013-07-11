class User < ActiveRecord::Base
  has_many    :ratings
  has_many    :beers,
                through: :ratings
  validates   :email,         
                presence:       true,
                uniqueness:     {case_sensitive: true},
                format:         {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

end
