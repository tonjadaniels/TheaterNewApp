class Production < ApplicationRecord

  has_many :performances
  has_many :roles
  has_many :professionals, through: :roles
  
  def start_date
    performances.order(date: :asc)[0].date
  end

  def end_date
    performances.order(date: :asc)[-1].date
  end


end
