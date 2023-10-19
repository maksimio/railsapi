class Api::V1::AppliesController < ApplicationController
    before_action :set_apply, only: [:show, :update, :mark_deleted, :destroy]
  
    def index
      @applies = Apply.filter_not_deleted
      if params[:geek_id]
        @applies = @applies.select{ |c| c.geek_id == params[:geek_id].to_i }
      end
      if params[:job_id]
        @applies = @applies.select{ |c| c.job_id == params[:job_id].to_i }
      end
      if params[:read]
        @applies = @applies.select{ |c| c.read == ActiveModel::Type::Boolean.new.cast(params[:read]) }
      end
      if params[:invited]
        @applies = @applies.select{ |c| c.invited == ActiveModel::Type::Boolean.new.cast(params[:invited]) }
      end
        
      render json: @applies.as_json(except: [:created_at, :updated_at, :deleted])
    end
  
    def show
      render json: @apply.as_json(except: [:created_at, :updated_at, :deleted])
    end
  
    def create
      @apply = Apply.new(apply_params)
      if @apply.save
        render json: @apply.as_json(except: [:created_at, :updated_at, :deleted])
      else
        render json: {user: @apply.errors, status: :no_content}
      end
    end
  
    def update
      if @apply.update(apply_params)
        render json: @apply.as_json(except: [:created_at, :updated_at, :deleted])
      else
        render json: @apply.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      self.mark_deleted
    end

    def mark_deleted
      if @apply.deleted
        render json: { deleted_already: :not_modified }
      else
        @apply.mark_deleted
        render json: { deleted: @apply.as_json(except: [:created_at, :updated_at, :deleted]), status: :success }
      end
    end
  
    private
    def set_apply
      if params[:apply_id]
        params[:id] = params[:apply_id]
      end
      @apply = Apply.find(params[:id])
    end
  
    def apply_params
      params.permit(:job_id, :geek_id, :read, :invited)
    end
  end