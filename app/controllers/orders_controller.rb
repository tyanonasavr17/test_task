class OrdersController < ApplicationController
  def orders_list
    orders = Dish.available_dishes_per_person
    render json: orders
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render json: { error: 'Не удалось создать заказ' }
    end
  end


  private

  def order_params
    if params.key?(:order)
      params.require(:order).permit(excluded_ingredients: [])
    else
      { excluded_ingredients: [] }
    end
  end
end
