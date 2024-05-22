class HistoryBuyer
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, 
                :street_address, :building, :phone_number, :history_id

  with_options presence: true do 
    validates :item_id, :user_id, :post_code, :city, 
              :street_address, :phone_number
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  attr_accessor :token

  def save
    # 購入履歴を保存する
    @history = History.create(item_id: item_id, user_id: user_id)
    # 買い手の住所を保存する
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city,
                 street_address: street_address, building: building, phone_number: phone_number, 
                 history_id: @history.id)
  end
end