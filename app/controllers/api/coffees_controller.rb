class Api::CoffeesController < ApplicationController
  
  def index
    @coffees = Coffee.all
    render 'index', formats: :json, handlers: 'jbuilder'
  end

  def show
    @coffee = Coffee.find(params[:id])
    render 'show', formats: :json, handlers: 'jbuilder'
  end
end
