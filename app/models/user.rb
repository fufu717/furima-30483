class User < ApplicationRecord
  
   validates :nickname,:first_name, :last_name, :birth_day, presence: true

   validates :password, presence: true,
             format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}

   validates :first_name_kana, :last_name_kana, presence: true, 
             format: { with: /\A([ァ-ン]|ー)+\z/, message: "is must NOT contain any other characters than alphanumerics." }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
 
end
