require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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


    find('a h4').click

    # DEBUG
    # save_screenshot

    # VERIFY: There should only be one article containing product details per product. 
    expect(page).to have_css 'article.product-detail', count: 1

  end
end
