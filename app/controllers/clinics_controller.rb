class ClinicsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "test"
    
    def new
        @clinic = Clinic.new
    end

    def index
        @clinics = Clinic.all.order(:name, :city, :address)
    end

    def show
        @clinic = Clinic.find(params[:id])
    end

    def edit
        @clinic = Clinic.find(params[:id])
    end

    def update
        @clinic = Clinic.find(params[:id])

        if @clinic.update(clinic_params)
            redirect_to @clinic
        else
            render 'edit'
        end
    end

    def destroy
        @clinic = Clinic.find(params[:id])
        @clinic.destroy

        redirect_to clinics_path
    end

    def create
        @clinic = Clinic.new(clinic_params)

        if @clinic.save
            redirect_to @clinic
        else
            render 'new'
        end
    end

    private
        def clinic_params
            params.require(:clinic).permit(:name, :address, :city, :phone)
        end
end
