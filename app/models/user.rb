class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many: items
  has_many: puchases
  
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
  validates :password, :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶ一]+\z/ }
end
