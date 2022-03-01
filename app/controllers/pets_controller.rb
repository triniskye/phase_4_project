require_relative "./sessions_controller.rb"

class PetsController < ApplicationController
    # @@logged_in = SessionsController.logged_in
    # @@logged_in == true ? layout "logged_in_nav" : layout "nav"
    layout "nav"

    def nav_selector
        @logged_in = SessionsController.logged_in
    end

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
        if check_pet == true
            pet= Pet.new(pet_params)
            pet.adoptable = true
            pet.save
            redirect_to pet_path(pet)
        else
            flash.alert = "cannot leave any fields blank"
            redirect_to new_pet_path
        end
    
    end
    def check_pet
        pet_params.each do |pet_attr|
            pet_attr != ""
        end
    end

    private
    def pet_params
        params.require(:pet).permit(:name, :age, :gender, :breed, :image_address, :description)
    end
    

end
