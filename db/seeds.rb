#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# if Rails.env.development?
#  AdminUser.create!(email: "admin@example.com", password: "password",
#                    password_confirmation: "password")
# end
categories = 0
require "faker"
dont_do = false
if dont_do == false
  until categories == 10
    new_category = Category.new
    new_category.name = Faker::Commerce.department(max: 1)
    categories += 1
    new_category.save!
    times_done = 0
    while times_done != 10
      new_product = new_category.products.build(name:        Faker::Commerce.product_name,
                                                description: Faker::Company.bs,
                                                unit_price:  Faker::Number.decimal(l_digits: 2),
                                                quantity:    Faker::Number.non_zero_digit,
                                                on_sale:     "N")
      new_product.save!
      times_done += 1
    end
  end
end
