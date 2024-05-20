class History < ApplicationRecord
  #user-item-historyのアソシエーション
  belongs_to :item
  belongs_to :user
  has_one :buyer
end