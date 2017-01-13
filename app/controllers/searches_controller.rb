class SearchesController < ApplicationController
    def index

    end

    def query
        @contacts = Contact.joins(:clinic).joins(:spec)
        @contacts = @contacts.where("name LIKE ?", "%#{params[:name]}%") unless params[:name].blank?
        @contacts = @contacts.where("surname LIKE ?", "%#{params[:surname]}%") unless params[:surname].blank?
        @contacts = @contacts.where("clinics.name LIKE ?", "%#{params[:clinic_name]}%") unless params[:clinic_name].blank?
        @contacts = @contacts.where("clinics.city LIKE ?", "%#{params[:clinic_city]}%") unless params[:clinic_city].blank?
        @contacts = @contacts.where("clinics.address LIKE ?", "%#{params[:clinic_address]}%") unless params[:clinic_address].blank?
        @contacts = @contacts.where("clinics.phone LIKE ?", "%#{params[:clinic_phone]}%") unless params[:clinic_phone].blank?
        @contacts = @contacts.where("specs.name LIKE ?", "%#{params[:spec_name]}%") unless params[:spec_name].blank?
        @contacts = @contacts.where("specs.description LIKE ?", "%#{params[:spec_description]}%") unless params[:spec_description].blank?
    end
end
