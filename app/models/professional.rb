class Professional < ApplicationRecord

  has_many :roles
  has_many :productions, through: :roles
  
end
