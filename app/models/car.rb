class Car < ActiveRecord::Base
  has_many :parts

  validates_presence_of :brand, :model, :year
  validates_numericality_of :year

  def display_name
    title = "#{brand} #{model} #{year}";
  end
end
