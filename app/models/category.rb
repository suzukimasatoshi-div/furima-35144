class category < ActiveHash::Base
  self.date = [

  ]

  include ActiveHash::Associations
  has_many :items