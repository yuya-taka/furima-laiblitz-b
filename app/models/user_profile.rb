class UserProfile < ApplicationRecord
  belongs_to :user
  validates :family_name, :first_name, presence: true,
                          format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）での入力が必須です' }
  validates :first_name_kana, :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）での入力が必須です' }
  validates :birthday, presence: true
end
