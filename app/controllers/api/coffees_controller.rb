class Api::CoffeesController < ApplicationController
  def show
    @coffee = Coffee.find(params[:id])
    render 'show', formats: :json, handlers: 'jbuilder'
  end
end
