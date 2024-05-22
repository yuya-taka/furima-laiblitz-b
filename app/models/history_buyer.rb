class HistoryBuyer
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city,
                :street_address, :building, :phone_number, :history_id,:token

  validates :token, presence: true
  with_options presence: true do
      validates :item_id
      validates :user_id
      validates :post_code
      validates :city
      validates :street_address
      validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁ハイフン4桁」の形式で入力してください' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数値のみ入力してください' }

  def save
    # 購入履歴を保存する
    @history = History.create(item_id:, user_id:)
    # 買い手の住所を保存する
    Buyer.create(post_code:, prefecture_id:, city:,
                 street_address:, building:, phone_number:,
                 history_id: @history.id)
  end
end
