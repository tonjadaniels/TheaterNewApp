class Production < ApplicationRecord

  has_many :performances
  has_many :roles
  has_many :professionsals, through: :roles
  
end
