class Buyer < ApplicationRecord
  belongs_to :history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, presence: true

  attr_accessor :token
  validates :token, presence: true
end
