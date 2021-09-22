class Buy < ApplicationRecord
  belongs_to :reserve
  belongs_to :user
  
end
