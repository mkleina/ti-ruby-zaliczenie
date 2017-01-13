class SpecsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "test"
    
    def new
        @spec = Spec.new
    end

    def index
        @specs = Spec.all.order(:name, :description)
    end

    def show
        @spec = Spec.find(params[:id])
    end

    def edit
        @spec = Spec.find(params[:id])
    end

    def update
        @spec = Spec.find(params[:id])

        if @spec.update(spec_params)
            redirect_to @spec
        else
            render 'edit'
        end
    end

    def destroy
        @spec = Spec.find(params[:id])
        @spec.destroy

        redirect_to specs_path
    end

    def create
        @spec = Spec.new(spec_params)

        if @spec.save
            redirect_to @spec
        else
            render 'new'
        end
    end

    private
        def spec_params
            params.require(:spec).permit(:name, :description)
        end
end
