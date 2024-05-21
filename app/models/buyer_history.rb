class BuyerHistory
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
  end
  def save(params,user_id)
    history = History.create(item_id: params[:item_id].to_i, user_id: user_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end
end


