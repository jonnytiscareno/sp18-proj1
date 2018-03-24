class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def capture
    pokemon = Pokemon.find(params[:id])
    pokemon.trainer = current_trainer
    pokemon.save
    redirect_to root_path
  end

  def create
    @new_pokemon = Pokemon.new(pokemon_params)
    @new_pokemon.health = 100
    @new_pokemon.level = 1
    @new_pokemon.trainer = current_trainer
    if @new_pokemon.save
      redirect_to current_trainer
    else
      redirect_to new_pokemon_path
    end
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :ndex)
  end
  def new
    @new_pokemon = Pokemon.new
  end
end
