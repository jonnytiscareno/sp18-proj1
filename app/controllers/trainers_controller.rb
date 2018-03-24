class TrainersController < ApplicationController
  before_action :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def damage
    pokemon = Pokemon.find(params[:id])
    pokemon.health = pokemon.health - 10
    if pokemon.health <= 0
      pokemon.destroy
    end
    if pokemon.health > 0
      pokemon.save
    end
    redirect_back(fallback_location: root_path)
  end

end
