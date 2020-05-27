class ItemsController < ApplicationController
    before_action :find_item, only: [:show, :update, :destroy]
    def index 
        items = Item.all 

        render :json => items, include: :user
    end
    def show 
        
        render json: item, include: :user
    end

    def create 
        @item = Item.new(item_params)
        @item.trade_rating = @item.calculate_trade_rating
        #check Item model for trade rating method and explanation
        if @item.save 
            render json: @item, status: :created

        else 
            render json: @item.errors, status: :error
        end

    end
    def update
        if @item.update(item_params)
         render json: @item
        else
         render json: @item.errors, status: :error
        end
       end

    def destroy
        item.destroy 
    end

    private 

    def find_item 
        item = Item.find_by(id: params[:id])
    end

    def item_params 
        params.require(:item).permit(:brand, :model, :description, :condition, :retail_value, :finish, :user_id)
    end

end
