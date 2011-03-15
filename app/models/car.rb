class Car < ActiveRecord::Base
  has_many :parts, :dependent => :delete_all
  accepts_nested_attributes_for :parts

  validates_presence_of :brand, :model, :year
  validates_numericality_of :year

  def display_name
    title = "#{brand} #{model} #{year}";
  end
end
