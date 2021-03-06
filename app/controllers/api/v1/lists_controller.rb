class Api::V1::ListsController < ApplicationController
  
  
  def index
    @lists = List.all 
    render json: @lists
  end

  def show
    @list = List.find(params[:id])
    render json: @list 
  end

  def create 
    @list = List.create(list_params)
    render json: @list
  end

  def update
    @list = List.find_by(id: params[:id])
    @list.update(list_params)
    render json: @list
  end

  def destroy 
    @list = List.find(params[:id])
    List.destroy(@list)
  end

  private

    def list_params
      params.require(:list).permit(:title, :description)
    end

end
