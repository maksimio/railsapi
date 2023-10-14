class Api::V1::JobsController < ApplicationController
    before_action :set_job, only: [:show, :update, :mark_deleted]
  
    def index
      if params[:company_id]
        @applies = Company.find(params[:company_id]).applies
      else
        @applies = Apply.all
      end
      render json: { jobs: @jobs }, except: [:id, :created_at, :updated_at]
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
  
    def mark_deleted
      if @apply.deleted
        puts "deleted: "
        render json: { deleted_job: [],
                       deleted_already: :not_modified,
        }
      else
        @apply.mark_delete
        render json: { deleted_company: @aplly,
                       code: 200,
                       status: :success,
        }, except: [:created_at, :updated_at]
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