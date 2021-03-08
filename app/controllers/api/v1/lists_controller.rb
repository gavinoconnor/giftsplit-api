class Api::V1::ListsController < ApplicationController
  
  
  def index
    @lists = List.all 
    render json: @lists
  end

  def create 
    @list = List.create!(list_params)
      if @list
       render json: @list
      else 
       render json: @list.errors
      end
  end

  def update
    @list = List.find_by(id: params[:id])
    @list.update(list_params)
    render json: @list
  end

  def destroy 
    @list = List.find(params[:id])
    @list.destroy
  end

  private

    def list_params
      params.require(:list).permit(:title, :description)
    end

end
