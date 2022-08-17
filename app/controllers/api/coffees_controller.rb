class Api::CoffeesController < ApplicationController
  protect_from_forgery :except => [:create]
  
  def index
    @coffees = Coffee.all
    render 'index', formats: :json, handlers: 'jbuilder'
  end

  def show
    @coffee = Coffee.find(params[:id])
    render 'show', formats: :json, handlers: 'jbuilder'
  end

  def create
    @coffee = Coffee.new(coffee_params)
    if @coffee.save
      head :no_content
    else
      render json: @coffee.errors, 
      # バリデーションエラーを返す
      status: :unprocessable_entity
    end
  end

    private

    def coffee_params
      params.fetch(:coffee, {}).permit(
        :product_name, :price, :weight, :purchashing_system,
        :degree_of_roasting, :grind, :brew, :shop, :comment
      )
    end
end
