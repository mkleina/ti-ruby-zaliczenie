class SearchesController < ApplicationController
    def index

    end

    def query
        @contacts = Contact.all
        @contacts = @contacts.where(:name => params[:name]) unless params[:name].blank?
        @contacts = @contacts.where(:surname => params[:surname]) unless params[:surname].blank?
    end
end
