class SpicesController < ApplicationController
    #Get /spices
    def index
        spices = Spice.all
        render json: spices 
    end
    #POST /spices/:id
    def create
        spices = Spice.find_by(id: params[:id])
        render json: spices
    end
    #PATCH /spices/:id
    def update
        spices = Spice.find_by(id: params[:id])
        if spices
            spices.update(spices_params)
            render json: spices
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
        
    end
    #DELETE /spices/:id
    def destroy
        spices = Spice.find_by(id: params[:id])
        if spices
            spices.destroy
            head :no_content
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end
end
