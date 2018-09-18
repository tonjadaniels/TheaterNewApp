class Role < ApplicationRecord

  belongs_to :productions
  belongs_to :professionals
  
end
