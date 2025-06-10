# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#Clean state
Product.destroy_all
Order.destroy_all
Subscription.destroy_all
Customer.destroy_all
Payment.destroy_all

#Create products
Product.create!([{
  name: "PMS"
},
{
  name: "Motor de Reservas"
},
{
  name: "Channel Manager"
}])

p "Created #{Product.count} products"

#Create customers
Customer.create!([{
  name: "Everly Cisneros",
  email: "everly.cisneros@gmail.com",
  document: "98080346089",
  document_type: 0,
  type: 0
},
{
  name: "Blanche Walker",
  email: "blanche.walker@gmail.com",
  document: "06739999040",
  document_type: 0,
  type: 0
},
{
  name: "Macauley Quinn",
  email: "macauley.quinn@gmail.com",
  document: "89070302004",
  document_type: 0,
  type: 0
},
{
  name: "La Parisienne",
  email: "laparisienne@laparisienne.com",
  document: "65352725000194",
  document_type: 1,
  type: 1
},
{
  name: "Hello Hotel",
  email: "hellohotel@hellohotel.com",
  document: "47194061000109",
  document_type: 1,
  type: 1
},
{
  name: "Countryside Inn",
  email: "countrysideinn@countrysideinn.com",
  document: "40214678000191",
  document_type: 1,
  type: 1
}])

p "Created #{Customer.count} customers"

#Create orders
Order.create!([{
  Customer_id: Customer.all()[1].id,
  value: 15000
},
{
  Customer_id: Customer.all()[4].id,
  value: 20000
}])

p "Created #{Order.count} orders"

#Create subscriptions
subscriptions = Subscription.create!([{
  Customer_id: Customer.all()[2].id,
  value: 20000
},
{
  Customer_id: Customer.all[5].id,
  value: 30000
}])

p "Created #{Subscription.count} subscriptions"

p "Product 1: #{Product.all[0].id}, 2: #{Product.all[1].id}, 3: #{Product.all[2].id}"

#Create chargeable items
ChargeableItem.create!([{
  value: 5000,
  Product_id: Product.all[0].id,
  chargeable_id: Order.all()[0].id,
  chargeable_type: "Order",
},
{
  value: 5000,
  Product_id: Product.all[1].id,
  chargeable_id: Order.all()[0].id,
  chargeable_type: "Order",
},
{
  value: 5000,
  Product_id: Product.all[2].id,
  chargeable_id: Order.all()[0].id,
  chargeable_type: "Order",
},
{
  value: 20000,
  Product_id: Product.all[0].id,
  chargeable_id: Order.all()[1].id,
  chargeable_type: "Order",
},
{
  value: 10000,
  Product_id: Product.all[0].id,
  chargeable_id: Subscription.all()[0].id,
  chargeable_type: "Subscription",
},
{
  value: 5000,
  Product_id: Product.all[1].id,
  chargeable_id: Subscription.all()[0].id,
  chargeable_type: "Subscription",
},
{
  value: 5000,
  Product_id: Product.all[2].id,
  chargeable_id: Subscription.all()[0].id,
  chargeable_type: "Subscription",
},
{
  value: 20000,
  Product_id: Product.all[0].id,
  chargeable_id: Subscription.all()[1].id,
  chargeable_type: "Subscription",
},
{
  value: 5000,
  Product_id: Product.all[1].id,
  chargeable_id: Subscription.all()[1].id,
  chargeable_type: "Subscription",
},
{
  value: 5000,
  Product_id: Product.all[2].id,
  chargeable_id: Subscription.all()[1].id,
  chargeable_type: "Subscription",
}
])

p "Created #{ChargeableItem.count} chargeable items"

#Create payments
Payment.create!([{
  value: 15000,
  status: 0,
  payable_id: Order.all()[0].id,
  payable_type: "Order"
},{
  value: 20000,
  status: 1,
  payable_id: Order.all()[1].id,
  payable_type: "Order"
},{
  value: 20000,
  status: 0,
  payable_id: Subscription.all()[0].id,
  payable_type: "Subscription"
},{
  value: 30000,
  status: 1,
  payable_id: Subscription.all()[1].id,
  payable_type: "Subscription"
}])

p "Created #{Payment.count} payments"