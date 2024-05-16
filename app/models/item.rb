class Item < ApplicationRecord
  #user-item-historyのアソシエーション
  has_one :history
end
