class Api::V1::ListsController < ApplicationController
  def index
    @lists = List.all 
    render json: @lists
  end

  def update
    @list.update(list_params)
    if @list.save
      render json: @list, status: :accepted
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def list_params
    params.permit(:title, :description)
  end
  
end
