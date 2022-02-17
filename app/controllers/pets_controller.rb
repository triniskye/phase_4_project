class PetsController < ApplicationController
    layout "nav"
    def index
        @pets = Pet.all
    end
    def show
        @pet = Pet.find(params[:id])
    end
    def new
        @pet = Pet.new
    end
    def create
        pet= Pet.new(pet_params)
        pet.adoptable = true

        if pet.save
            redirect_to pet_path(pet)
        else
            redirect_to new_pet_path
        end
    
    end

    private
    def pet_params
        params.require(:pet).permit(:name, :age, :gender, :breed, :image_address, :description)
    end
end
