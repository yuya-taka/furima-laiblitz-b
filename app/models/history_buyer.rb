class HistoryBuyer
  include ActiveModel::Model
  attr_accessor :item, :user, :post_code, :prefecture_id, :city, 
                :street_address, :building, :phone_number, :history

  with_options  do #presence: true
    validates :item, :user, :post_code, :city, :street_address, 
              :building, :phone_number, :history
    #validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  # validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
end