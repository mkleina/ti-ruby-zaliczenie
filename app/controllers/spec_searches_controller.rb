class SpecSearchesController < ApplicationController
    def index

    end

    def query
        @specs = Spec.all
        @specs = @specs.where("name LIKE ?", "%#{params[:spec_name]}%") unless params[:spec_name].blank?
        @specs = @specs.where("description LIKE ?", "%#{params[:spec_description]}%") unless params[:spec_description].blank?
    end
end
