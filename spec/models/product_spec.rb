# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  item_type  :string(255)
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Product do
  #Create an instance of Product
  before do
    @product = Product.new(name: "Sample product", item_type: "Service", 
                     price: 3.12)
  end
  
  subject {@product}
  # Test if Product Model should respond to its attributes
  it { should respond_to(:name) }
  it { should respond_to(:item_type) }
  it { should respond_to(:price) }
  
  describe "when name is not present" do
	before { @product.name = "" }
	it { should_not be_valid }
  end
  
  describe "when item_type is not present" do
	before { @product.item_type = "" }
	it { should_not be_valid }
  end
  
  describe "when price is not numerical" do
	before { @product.price = "" }
	it { should_not be_valid }
  end
  
end
