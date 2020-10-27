class Order
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:postal_code,:prefecture_id,:city,:address,:building,:phone,:purchase,:token

  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end


 

  def save
        purchase = Purchase.create(item_id: item_id, user_id: user_id)

        Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building,phone: phone, purchase_id: purchase.id)
  end
end