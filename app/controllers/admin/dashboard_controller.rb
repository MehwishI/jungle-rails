class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password'], except: :index

  def show
    #count number of products
    @count_products = Product.count

    #count number of categories
    @count_categories= Category.count
  end
end
