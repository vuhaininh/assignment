namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Product.create!(name: "Example Product",
                 item_type: "Product", price: 3)
    99.times do |n|
      name  = Faker::Name.name
      item_type= "Product"
      Product.create!(name: name,
                   item_type: item_type, price: 3)
    end
  end
end