class ClinicSearchesController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "test"
    
    def index

    end

    def query
        @clinics = Clinic.all
        @clinics = @clinics.where("name LIKE ?", "%#{params[:clinic_name]}%") unless params[:clinic_name].blank?
        @clinics = @clinics.where("name LIKE ?", "%#{params[:clinic_city]}%") unless params[:clinic_city].blank?
        @clinics = @clinics.where("name LIKE ?", "%#{params[:clinic_address]}%") unless params[:clinic_address].blank?
        @clinics = @clinics.where("name LIKE ?", "%#{params[:clinic_phone]}%") unless params[:clinic_phone].blank?
    end
end
