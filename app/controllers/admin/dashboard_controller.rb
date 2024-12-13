class Admin::DashboardController < ApplicationController
  def show
    @total_products = Product.count
    @total_product_quantity = Product.sum('quantity')
    @total_categories = Category.count
  end
end
