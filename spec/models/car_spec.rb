require 'spec_helper'

describe Car do
  before(:each) do
    @valid_attributes = {
      :brand => 'Dodge',
      :model => 'Intrepid',
      :year => '2001'
    }
  end

  it "should create a new instance given valid attributes" do
    Car.create!(@valid_attributes)
  end

  it "should be invalid without a brand" do
    @valid_attributes[:brand] = nil
    car = Car.create(@valid_attributes)
    car.should have(1).error_on(:brand)
  end

  it "should be invalid without a model" do
    @valid_attributes[:model] = nil
    car = Car.create(@valid_attributes)
    car.should have(1).error_on(:model)
  end

  it "should be invalid without a year" do
    @valid_attributes[:year] = nil
    car = Car.create(@valid_attributes)
    car.should have(2).error_on(:year)
  end

  it "should be invalid without a numerical year" do
    @valid_attributes[:year] = 'ten'
    car = Car.create(@valid_attributes)
    car.should have(1).error_on(:year)
  end
  
end
