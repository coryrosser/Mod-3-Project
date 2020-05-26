class TradesController < ApplicationController
    before_action :find_trade, only: [:show, :update, :destroy]
    def index 
        trades = Trade.all 

        render :json => trades
    end

    def create 
        @trade = Trade.create!(trade_params)
        @trade.update(status: 0) 
        if @trade
            @trade.save
            @trader_item = Item.find_by(id: params[:trader_item_id])
            @tradee_item = Item.find_by(id: params[:tradee_item_id])
            @trader_item.update(user_id: params[:tradee_id])
            @tradee_item.update(user_id: params[:trader_id])
            render json: @trade
        else 
            render json: {status: "error"}
        end

    end

    private 

    def find_trade 
        trade = Trade.find_by(id: params[:id])
    end

    def trade_params 
        params.require(:trade).permit(:trader_id, :trader_item_id, :tradee_id, :tradee_item_id)
    end
end
