class Admin::DashboardController < ApplicationController
  def show
    #count number of products
    @count_products = Product.count

    #count number of categories
    @count_categories= Category.count
  end
end
