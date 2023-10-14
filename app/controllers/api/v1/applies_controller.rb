class Api::V1::JobsController < ApplicationController
    before_action :set_job, only: [:show, :update, :mark_deleted, :destroy]
  
    def index
      if params[:company_id]
        @applies = Apply.filter_not_deleted().find(params[:company_id]).applies
      else
        @applies = Apply.filter_not_deleted
      end
      render json: { jobs: @applies }, except: [:id, :created_at, :updated_at, :deleted]
    end
  
    def show
      render json: @apply
    end
  
    def create
      @apply = Apply.new(apply_params)
      if @apply.save
        render json: @apply.as_json, status: :created
      else
        render json: {user: @apply.errors, status: :no_content}
      end
    end
  
    def update
      if @apply.update(apply_params)
        render json: @apply
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
        render json: { deleted: @apply, status: :success }, except: [:created_at, :updated_at, :deleted]
      end
    end
  
    private
    def set_apply
      @apply = Apply.find(params[:id])
    end
  
    def apply_params
      params.permit(:job_id, :geek_id)
    end
  end