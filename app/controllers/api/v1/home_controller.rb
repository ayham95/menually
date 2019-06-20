class Api::V1::HomeController < ApplicationController
  def index
    categories = Category.all.map {|c| HomeCategorySerializer.new(c).as_json}
    render json: {categories: categories, offers: Offer.all}
  end
end
