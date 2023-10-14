class Api::V1::JobsController < ApplicationController
    before_action :set_job, only: [:show, :update, :mark_deleted, :destroy]
  
    def index
      @jobs = Job.filter_not_deleted
      if params[:place]
        @jobs = @jobs.select{ |c| c.place == params[:place] }
      end
      if params[:name]
        @jobs = @jobs.select{ |c| c.name == params[:name] }
      end
      if params[:company_id]
        @jobs = @jobs.select{ |c| c.company_id == params[:company_id].to_i }
      end

      render json: @jobs.as_json(except: [:created_at, :updated_at, :deleted])
    end
  
    def show
      render json: @job.as_json(except: [:created_at, :updated_at, :deleted])
    end
  
    def create
      @job = Job.new(job_params)
      if @job.save
        render json: @job.as_json(except: [:created_at, :updated_at, :deleted])
      else
        render json: {user: @job.errors, status: :no_content}
      end
    end
  
    def update
      if @job.update(job_params)
        render json: @job.as_json(except: [:created_at, :updated_at, :deleted])
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
        render json: { deleted: @job.as_json(except: [:created_at, :updated_at, :deleted]), status: :success }
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
      params.permit(:place, :name)
    end
end