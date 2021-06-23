class shipping_charge < ActiveHash::Base
  self.date = [
    
  ]

  include ActiveHash::Associations
  has_many :items