class OrdersController < ApplicationController

    def index
        orders = Order.all
        render json: orders
    end 
 
    def create
        @order = Order.create(order_params)
        render json: @order, status: :created
    end
 
    def update
        order = Order.find(params[:id])
        if order.update(order_params)
            @products = order.order_items.map do |orderitem|
                orderitem.product 
            end 
            @products.each do |product|
                product.update(buyer: current_user.id, sold: true)
            end 
            render json: order, status: :created
        else 
            render json: { message: 'Order submission failed. Please try again.' }, status: :unprocessable_entity
        end 
    end 
 
    def destroy
    end
 
    private

    def order_params
        params.require(:order).permit(:user_id, :total, :complete)
    end

end