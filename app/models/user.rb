class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :password, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
    validates :first_name 
    validates :last_name
    #validates :name_full_width, format: { with: /\p{katakana}//\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
end
