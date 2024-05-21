class Buyer < ApplicationRecord
  attr_accessor :token
  validates :token, presence: true
end
