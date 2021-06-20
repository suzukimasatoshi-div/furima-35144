class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :password, format: { with: /(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}/ }
    validates :first_name_full_width, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name_kana_full_width, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_full_width, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name_kana_full_width, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end
