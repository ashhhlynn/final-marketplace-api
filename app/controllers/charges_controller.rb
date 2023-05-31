require 'stripe'
require 'dotenv'
Dotenv.load

class ChargesController < ApplicationController
    skip_before_action :authorize
    def create
       amount = params[:price]
       token = params[:charge][:token]
       Stripe.api_key = ENV['STRIPE_PUBLISHABLE_KEY']
       charge = Stripe::Charge.create(
             amount: amount,
             currency: 'usd',
             source: token
       )
         if charge.paid
             render json: { message: 'Payment processed successfully', status: 'succeeded' }, status: :ok
         else
             render json: { error: 'Payment processing failed' }, status: :unprocessable_entity
         end
     rescue Stripe::CardError => e
         render json: { error: e.message }, status: :unprocessable_entity
     end
end