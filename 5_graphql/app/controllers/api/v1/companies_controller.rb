class Api::V1::CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :update, :mark_deleted, :destroy]
  
    def index
      @companies = Company.filter_not_deleted
      if params[:location]
        @companies = @companies.select{ |c| c.location == params[:location] }
      end
      if params[:name]
        @companies = @companies.select{ |c| c.name == params[:name] }
      end

      render json: @companies.as_json(except: [:created_at, :updated_at, :deleted])
    end
  
    def show
      render json: @company.as_json(except: [:created_at, :updated_at, :deleted])
    end
  
    def create
      @company = Company.new(company_params)
      if @company.save
        render json: @company.as_json(except: [:created_at, :updated_at, :deleted])
      else
        render json: {user: @company.errors, status: :no_content}
      end
    end
  
    def update
      if @company.update(company_params)
        render json: @company.as_json(except: [:created_at, :updated_at, :deleted])
      else
        render json: @company.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      self.mark_deleted
    end

    def mark_deleted
      if @company.deleted
        render json: { deleted_already: :not_modified }
      else
        @company.mark_deleted
        render json: { deleted: @company.as_json(except: [:created_at, :updated_at, :deleted]), status: :success }
      end
    end
  
    private
    def set_company
      if params[:company_id]
        params[:id] = params[:company_id]
      end
      @company = Company.find(params[:id])
    end
  
    def company_params
      params.permit(:location, :name)
    end
  end