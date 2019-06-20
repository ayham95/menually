class Api::V1::HomeController < ApplicationController
  def index
    categories = Category.all.map {|c| HomeCategorySerializer.new(c)}
    render json: [categories: HomeCategorySerializer.new(Category.all), offers: Offer.all]
  end
end
