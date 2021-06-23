class days_to_delivery < ActiveHash::Base
  self.date = [
    
  ]

  include ActiveHash::Associations
  has_many :items