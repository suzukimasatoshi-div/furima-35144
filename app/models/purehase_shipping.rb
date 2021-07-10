class PurehaseShipping

  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :municipality, :address, :building_name, :phone_number, :purehase, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code
    validates :delivery_area_id,  numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, length: {maximum: 11 }
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

    
  def save
    purehase = Purehase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purehase_id: purehase.id)
  end
end