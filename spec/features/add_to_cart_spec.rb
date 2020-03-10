require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 3,
        price: 64.99
      )
    end
  end

  scenario "They see click a product and get redirected to the product's detail page." do
    # ACT
    visit root_path
    
    find(:button, 'Add').click

    expect(page).to have_content('My Cart (1)')

  end
end