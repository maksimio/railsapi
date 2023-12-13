class ResortsController < ApplicationController
  # GET /resorts
  def index
    render json: Resort.all
  end

  # GET /resorts/1
  def show
    render json: Resort.find(params[:id])
  end
end
