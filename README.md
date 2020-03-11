# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Setup

Clone this repository onto you local machine with
`git clone <url>`

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

## Screen Shots

The following pictures depict our homepage where you can select items to add to your cart; see what your cart contains and then pay by card. Your order recipt will
contain the details of your purchase!

!["Home Page"](https://github.com/mxrosenthal/jungle-rails/blob/master/docs/Home%20page.png?raw=true)
!["Cart"](https://github.com/mxrosenthal/jungle-rails/blob/master/docs/cart.png?raw=true)
!["Pay With your card."](https://github.com/mxrosenthal/jungle-rails/blob/master/docs/pay%20by%20card.png?raw=true)
!["Order recipt"](https://github.com/mxrosenthal/jungle-rails/blob/master/docs/order%20recite.png?raw=true)
