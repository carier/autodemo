require 'spec_helper'

describe Part do
  before(:each) do
    @valid_car_attributes = {
      :brand => 'Dodge',
      :model => 'Intrepid',
      :year => '2001'
    }

    @valid_attributes = {
      :car => Car.create(@valid_car_attributes),
      :title => 'Oil filter',
      :offstock => true,
      :retail_cost => 9.99,
      :final_cost => 4.99
    }
  end

  it "should create a new instance given valid attributes" do
    Part.create!(@valid_attributes)
  end

  it "should be invalid without a car" do
    @valid_attributes[:car] = nil
    part = Part.create(@valid_attributes)
    part.should have(1).error_on(:car)
  end

  it "should be invalid without a title" do
    @valid_attributes[:title] = nil
    part = Part.create(@valid_attributes)
    part.should have(2).error_on(:title)
  end

  it "should only allow title length >= 5" do
    @valid_attributes[:title] = 'test'
    part = Part.create(@valid_attributes)
    part.should have(1).error_on(:title)
  end

  it "should be invalid without a retail cost" do
    @valid_attributes[:retail_cost] = nil
    part = Part.create(@valid_attributes)
    part.should have(2).error_on(:retail_cost)
  end

  it "should be invalid without a numerical retail cost" do
    @valid_attributes[:retail_cost] = 'ten'
    part = Part.create(@valid_attributes)
    part.should have(1).error_on(:retail_cost)
  end

  it "should be invalid without a final cost" do
    @valid_attributes[:final_cost] = nil
    part = Part.create(@valid_attributes)
    part.should have(2).error_on(:final_cost)
  end

  it "should be invalid without a numerical final cost" do
    @valid_attributes[:final_cost] = 'ten'
    part = Part.create(@valid_attributes)
    part.should have(1).error_on(:final_cost)
  end

  it "should only allow final cost value > retail cost value" do
    @valid_attributes[:final_cost] = @valid_attributes[:retail_cost].to_f + 0.01
    part = Part.create(@valid_attributes)
    part.should have(1).error_on(:final_cost)
  end

end
