class PlantsController < ApplicationController
    def index
    plants = Plant.all
    render json: plants
    end

    def create
    plant = Plant.create(plant_params)
    render json: plant
    end

    def update
        plant = Plant.find(params[:id])
        plant.update(plant_params)
        if plant.valid?
        render json: plant
        end
    end

    def destroy
        plant = Plant.find(params[:id])
        plant.destroy
        render json: plant
    end

    private
    def plant_params
    params.require(:plant).permit(:name, :age, :enjoy, :image)
    end
end

