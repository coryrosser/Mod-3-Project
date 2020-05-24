class TradesController < ApplicationController
    before_action :find_trade, only: [:show, :update, :destroy]
    def index 
        trades = Trade.all 

        render :json => trades
    end

    def create 
        @trade = Trade.new(trade_params)
        if @trade.save 
            render json: @trade, status: :created

        else 
            render json: @trade.errors, status: :error
        end

    end

    private 

    def find_trade 
        trade = Trade.find_by(id: params[:id])
    end

    def trade_params 
        params.require(:trade).permit(:brand, :model, :description, :condition, :retail_value, :finish, :user_id)
    end
end
