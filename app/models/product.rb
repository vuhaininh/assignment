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

class Product < ActiveRecord::Base
  attr_accessible :item_type, :name, :price
  
  # Name should be filled, maximum length is 30 char
  validates :name, presence: true, length: { maximum: 30 }
  
  # Item type should be filled
  validates :item_type, presence: true
  
  # Price should be filled and numerical
  validates :price, presence: true, numericality: true
 
  # Search function to search product by name, have pagination
 def self.searchByName(search, page)
	  if search
	      paginate :per_page => 5, :page => page,
           :conditions => ['name ILIKE ?', "%#{search}%"],
           :order => 'updated_at DESC'
	  else
		    paginate :per_page => 5, :page => page,
           :order => 'updated_at DESC'
	  end
  end
  # Filter function to Filterproduct by name, have pagination
  def self.filterType(filter, page)
	  if filter
	      paginate :per_page => 5, :page => page,
           :conditions => ['item_type LIKE ?', "#{filter}"],
           :order => 'updated_at DESC'
	  else
		    paginate :per_page => 5, :page => page,
           :order => 'updated_at DESC'
	  end
  end
end
