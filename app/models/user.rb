class User < ActiveRecord::Base
  validates   :email,         
                presence:       true,
                uniqueness:     {case_sensitive: true},
                format:         {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

end
