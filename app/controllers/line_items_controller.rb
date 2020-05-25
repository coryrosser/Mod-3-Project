class LineItemsController < ApplicationController
  before_action :find_line_item, only: :update
  
  def create
    @line_item = LineItem.new(line_item_params)
      if @line_item.save
        render json: @lineitem
  end

  def update
    if @line_item.update(line_item_params)
      render json: @line_item
    else 
      render json: @line_item.errors, status: :error
  end

  private

  def find_line_item
    @line_item.find_by(id: params[:id])
  end
  
  def line_item_params
    params.require(:line_item).permit(:item_id, :user_id, :quantity)
  end

end
