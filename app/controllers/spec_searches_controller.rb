class SpecSearchesController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "test"
    
    def index

    end

    def query
        @specs = Spec.all
        @specs = @specs.where("LOWER(name) LIKE LOWER (?)", "%#{params[:spec_name]}%") unless params[:spec_name].blank?
        @specs = @specs.where("LOWER(description) LIKE LOWER (?)", "%#{params[:spec_description]}%") unless params[:spec_description].blank?
    end
end
