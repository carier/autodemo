class AddTestData < ActiveRecord::Migration
  def self.up
    Car.delete_all
    Car.create(
      :id => 1,
      :brand => 'Dodge',
      :model => 'Intrepid',
      :year => 2002
    )
    Car.create(
      :id => 2,
      :brand => 'Chrysler',
      :model => '300M',
      :year => 2004
    )

    Part.delete_all
    Part.create(
      :car_id => 1,
      :title => 'Oil Filter',
      :offstock => false,
      :retail_cost => 39.95,
      :final_cost => 29.95
    )
    Part.create(
      :car_id => 2,
      :title => 'Oil Filter',
      :offstock => true,
      :retail_cost => 35.95,
      :final_cost => 24.95
    )
    Part.create(
      :car_id => 2,
      :title => 'Fuel Filter',
      :offstock => false,
      :retail_cost => 19.95,
      :final_cost => 9.95
    )
  end

  def self.down
    Car.delete_all
    Part.delete_all
  end
end
