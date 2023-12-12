class Api::V1::GeeksController < ApplicationController
    before_action :set_geek, only: [:show, :update, :mark_deleted, :destroy]
  
    def index
      @geeks = Geek.filter_not_deleted
      if params[:stack]
        @geeks = @geeks.select{ |c| c.stack == params[:stack] }
      end
      if params[:name]
        @geeks = @geeks.select{ |c| c.name == params[:name] }
      end

      render json: @geeks.as_json(except: [:created_at, :updated_at, :deleted])
    end
  
    def show
      render json: @geek.as_json(except: [:created_at, :updated_at, :deleted])
    end
  
    def create
      @geek = Geek.new(geek_params)
      if @geek.save
        render json: @geek.as_json(except: [:created_at, :updated_at, :deleted])
      else
        render json: {user: @geek.errors, status: :no_content}
      end
    end
  
    def update
      if @geek.update(geek_params)
        render json: @geek.as_json(except: [:created_at, :updated_at, :deleted])
      else
        render json: @geek.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      self.mark_deleted
    end

    def mark_deleted
      if @geek.deleted
        render json: { deleted_already: :not_modified }
      else
        @geek.mark_deleted
        render json: { deleted: @geek.as_json(except: [:created_at, :updated_at, :deleted]), status: :success }
      end
    end
  
    private
    def set_geek
      if params[:geek_id]
        params[:id] = params[:geek_id]
      end
      @geek = Geek.find(params[:id])
    end
  
    def geek_params
      params.permit(:stack, :resume, :name)
    end
  end