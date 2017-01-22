class SearchesController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "test"
    
    def index

    end

    def query
        @contacts = Contact.joins(:clinic).joins(:spec)
        @contacts = @contacts.where("LOWER(contacts.name) LIKE LOWER (?)", "%#{params[:name]}%") unless params[:name].blank?
        @contacts = @contacts.where("LOWER(contacts.surname) LIKE LOWER (?)", "%#{params[:surname]}%") unless params[:surname].blank?
        @contacts = @contacts.where("LOWER(clinics.name) LIKE LOWER (?)", "%#{params[:clinic_name]}%") unless params[:clinic_name].blank?
        @contacts = @contacts.where("LOWER(clinics.city) LIKE LOWER (?)", "%#{params[:clinic_city]}%") unless params[:clinic_city].blank?
        @contacts = @contacts.where("LOWER(clinics.address) LIKE LOWER (?)", "%#{params[:clinic_address]}%") unless params[:clinic_address].blank?
        @contacts = @contacts.where("LOWER(clinics.phone) LIKE LOWER (?)", "%#{params[:clinic_phone]}%") unless params[:clinic_phone].blank?
        @contacts = @contacts.where("LOWER(specs.name) LIKE LOWER (?)", "%#{params[:spec_name]}%") unless params[:spec_name].blank?
        @contacts = @contacts.where("LOWER(specs.description) LIKE LOWER (?)", "%#{params[:spec_description]}%") unless params[:spec_description].blank?
    end
end
