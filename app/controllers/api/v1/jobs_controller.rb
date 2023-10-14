class Api::V1::JobsController < ApplicationController
    before_action :set_job, only: [:show, :update, :mark_deleted, :destroy]
  
    def index
      if params[:company_id]
        @jobs = Job.filter_not_deleted().find(params[:company_id])
      else
        @jobs = Job.filter_not_deleted
      end
      render json: { jobs: @jobs }, except: [:created_at, :updated_at, :deleted]
    end
  
    def show
      render json: @job
    end
  
    def create
      @job = Job.new(job_params)
      if @job.save
        render json: @job.as_json, status: :created
      else
        render json: {user: @job.errors, status: :no_content}
      end
    end
  
    def update
      if @job.update(job_params)
        render json: @job
      else
        render json: @job.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      self.mark_deleted
    end

    def mark_deleted
      if @job.deleted
        render json: { deleted_already: :not_modified }
      else
        @job.mark_deleted
        render json: { deleted: @job, status: :success }, except: [:created_at, :updated_at, :deleted]
      end
    end
  
  
    private
    def set_job
      if params[:job_id]
        params[:id] = params[:job_id]
      end
      @job = Job.find(params[:id])
    end
  
    def job_params
      params.permit(:place, :company_id, :name)
    end
end