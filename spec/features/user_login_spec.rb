require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  before :each do
    user = User.create! first_name: 'Max', last_name: "Zam", email: "a@a.com", password: "area51", password_confirmation: "area51"
  end

  scenario "They see click a product and get redirected to the product's detail page." do
    # ACT
    visit '/login'
    # puts page.html
    fill_in 'email', with: "a@a.com"
    fill_in 'password', with: "area51"
    click_on 'Submit'
    puts page.html
    expect(page).to have_content('a@a.com')

  end
end
