class Api::V1::BusinessesController < Api::ApplicationController
  before_action :set_business, only: [:show, :update, :destroy]
  before_action :authenticate_api_business!

  # GET /current business logo
  def index
    @logo = current_api_business.logo

    render json: @logo
  end

  # GET /businesses/1
  def show
    render json: @logo
  end

  # POST /businesses
  def create
    @business = Business.new(business_params)

    if @business.save
      render json: @business, status: :created, location: @business
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /businesses/1
  def update
    if @business.update(business_params)
      render json: @business
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  # DELETE /businesses/1
  def destroy
    @business.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

  # Only allow a trusted parameter "white list" through.
    def business_params
      params.require(:business).permit(:nameAr, :nameEn, :logo, :theme, :managerPhone, :wifiPassword)
    end
end
