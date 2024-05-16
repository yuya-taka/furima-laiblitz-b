class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  #  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "は有効なメールアドレスではありません" }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "は半角英数字混合で入力してください" }
  validates :password_confirmation, presence: true
  validate :password_confirmation_match

  private
  # パスワードとパスワード（確認）の一致を確認するカスタムバリデーション
  def password_confirmation_match
    errors.add(:password_confirmation, "とパスワードが一致しません") unless password == password_confirmation
  end
  validates :family_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）での入力が必須です" }
  validates :first_name_kana, :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角（カタカナ）での入力が必須です" }
  validates :birthday, presence: true

end