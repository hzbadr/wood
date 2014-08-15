# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'admin', email: 'admin@admin.com', password: '1234', password_confirmation: '1234')
User.create(username: 'employee', email: 'employee@admin.com', password: '1234', password_confirmation: '1234')

Category.create(name: 'Category 1')
Category.create(name: 'Category 2', parent_id: 1)
Category.create(name: 'Category 3', parent_id: 2)
Category.create(name: 'Category 4', parent_id: 1)
Category.create(name: 'Category 5')

products = (1..10).to_a.collect do |i|
  Product.create(name: "Product ##{i}", description: "desc #{i}")
end

products.each do |p|
  (1..50).to_a.sample(10).each do |i|  
    Variant.create(weight: rand(1..10), height: rand(1..10), width: rand(1..10), depth: rand(1..10), product_id: p.id, cost_price: i*rand(1..5), price: i*10)
  end
end

names = %w(Ahmed Mohamed Ali Samir Hassan Saleh Karim Tamer Hany Yasser)
(1..20).to_a.each do |i|
  first_name = names.sample
  last_name = names.sample
  Customer.create(first_name: first_name, last_name: last_name, email: "#{first_name}_#{i}@#{last_name}.com", address: "Address #{last_name}")
end

(1..20).to_a.each do |i|
  first_name = names.sample
  last_name = names.sample
  Supplier.create(first_name: first_name, last_name: last_name, email: "#{first_name}_#{i}@#{last_name}.com", address: "Address #{last_name}")
end

variants = Variant.all

customers = Customer.all

(1..30).to_a.each do |x|
  order = Order.create(customer_id: customers.sample.id, created_by_id: 2)
  (1..5).to_a.each do |i|
    order.line_items << LineItem.create(variant_id: variants.sample.id, quantity: rand(1..10)*i)
  end
end

methods = (1..4).to_a.collect do |i|
  PaymentMethod.create(name: "Payment #{i}")
end

(1..100).to_a.each do |i|
  Payment.create(amount: i*rand(1..100), user_id: customers.sample.id, payment_method_id: methods.sample.id, state: 'paid', date: DateTime.now.advance(days: -rand(1..60)))
end