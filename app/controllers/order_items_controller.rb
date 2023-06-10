class OrderItemsController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        order_items = OrderItem.all
        render json: order_items
    end

    def create
        order_item = OrderItem.create(order_item_params)
        if order_item.valid?
            render json: order_item
        else 
            render json: { message: 'Error: Item was not added. Click shop on the navbar and try again.' }, status: :unprocessable_entity
        end
    end

    def destroy
        order_item = OrderItem.find_by(id: params[:id])
        order_item.destroy
        head :no_content, status: :ok
    end

    private

    def order_item_params
        params.require(:order_item).permit(:id, :order_id, :price, :product_id, :title, :seller)
    end

end