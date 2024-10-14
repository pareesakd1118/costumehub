class CostumesController < ApplicationController

    def index
        @costumes = Costume.all
    end

    def new 
        @costume = Costume.new
    end

    def show
        @costume = Costume.find(params[:id])
    end

    def edit
        @costume = Costume.find(params[:id])
    end

    def create
        @costume = Costume.new(costume_params) 

        if @costume.save
            redirect_to @costume
        end
    end

    def update
        @costume = Costume.find(params[:id])

        if @costume.update(costume_params)
            redirect_to @costume
        end
    end

    def destroy
        @costume = Costume.find(params[:id])
        @costume.destroy
        
    end

    private
    def costume_params
        params.require(:costume).permit(:name, :category, :description)
    end
end
