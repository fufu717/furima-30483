class User < ApplicationRecord
   with_options presence: true do
   validates :nickname
   validates :first_name, :last_name,
             format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
   validates :first_name_kana, :last_name_kana, presence: true, 
             format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }
   validates :password, presence: true,
             format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
   validates :birth_day, presence: true
   end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
end
