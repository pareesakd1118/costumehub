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
        redirect_to @costume, notice: 'Costume was successfully created.'
      else
        flash.now[:alert] = 'Failed to create costume. Please try again.'
        render :new, status: :unprocessable_entity
      end
    end
  
    def update
      @costume = Costume.find(params[:id])
  
      if @costume.update(costume_params)
        redirect_to @costume, notice: 'Costume was successfully updated.'
      else
        flash.now[:alert] = 'Failed to update costume. Please try again.'
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @costume = Costume.find(params[:id])
      @costume.destroy
      redirect_to costumes_path, notice: 'Costume was successfully deleted.'
    end
  
    private
  
    def costume_params
      params.require(:costume).permit(:name, :category, :description)
    end
  end
  
