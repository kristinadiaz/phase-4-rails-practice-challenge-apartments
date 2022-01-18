class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        render json: Tenant.all 
    end

    def show
        render json: find_tenant
    end

    def create 
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def update
        tenant = find_tenant
        render json: tenant.update(tenant_params), status: :accepted
    end

    def destroy
        tenant = find_tenant
        tenant.destroy
        head :no_content
    end

    private

    def find_tenant
        Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end

    def render_unprocessable_entity_response
        render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity 
    end

    def render_not_found_response 
        render json: {errors: "Not Found"}, status: :not_found 
    end
end
