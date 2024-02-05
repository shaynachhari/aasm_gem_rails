class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])

  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :state)
  end
end



# mvc?
# class OrdersController < ApplicationController
#   before_action :set_order, only: [:show, :edit, :update, :destroy]

#   def index
#     @orders = Order.all
#     render json: @orders
#   end

#   def show
#     render json: @order
#   end

#   def new
#     @order = Order.new
#   end

#   def create
#     @order = Order.new(order_params)

#     if @order.save
#       render json: @order, status: :created
#     else
#       render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
#     end
#   end

#   def edit
#     # Not needed for JSON API
#   end

#   def update
#     if @order.update(order_params)
#       render json: @order
#     else
#       render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @order.destroy
#     head :no_content
#   end

#   private

#   def set_order
#     @order = Order.find(params[:id])
#   end

#   def order_params
#     params.require(:order).permit(:name, :state)
#   end
# end

