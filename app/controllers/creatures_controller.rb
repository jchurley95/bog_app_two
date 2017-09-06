class CreaturesController < ApplicationController
  def show
    @creature = Creature.find params[:id]
  end

  def index
    @creatures = Creature.all
  end

  def edit
    @creature = Creature.find params[:id]
  end

  def new
    @creature = Creature.new

  end

  def create
    @creature = Creature.new(creature_params)
    
    if @creature.save
      redirect_to creature_path(@creature)
    end
  end

  def update
    @creature = Creature.find params[:id]

    if @creature.update(creature_params)
      redirect_to creature_path(@creature)
    else 
      render :edit
    end
    
  end

  def destroy
    @creature = Creature.find params[:id]
    @creature.destroy
    redirect_to creatures_path
    
  end

  private
  def creature_params
    creature_params = params.require(:creature).permit(:name, :description)
  end

end
