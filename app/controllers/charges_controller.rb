require 'stripe'
require 'dotenv'
Dotenv.load

class ChargesController < ApplicationController
    skip_before_action :authorized
    def create
       amount = params[:price]
       token = params[:charge][:token]
       Stripe.api_key = pk_test_51MxwZpLMhdX9PVRj9jc1MEjDj8uT21Wd5Qve63Q84iXXc27LUH4KrBL0mNfw4HTYAj4rPUVwMMKSy8oIq7fBYAB100EqL62dlD
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