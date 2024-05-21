class Buyer < ApplicationRecord
  belongs_to :history
  attr_accessor :token
end
