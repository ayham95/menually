class Api::V1::HomeController < Api::ApplicationController
  before_action :authenticate_api_business!

  def index
    categories = Category.all.map {|c| HomeCategorySerializer.new(c).as_json}
    render json: {categories: categories, offers: Offer.all}
  end
end
