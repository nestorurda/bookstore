class Reserve < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :buys
end
