# class GamesController < ApplicationController
#   before_action :authenticate_user!

#   def new
#     @game = Game.new
#   end

#   def create
#     @game = Game.new
#     @game.user = current_user

#     if @game.save
#       @partie = Partie.create(game: @game)
#       redirect_to new_game_party_path(@game)
#     else
#       render :new
#     end
#   end
# end
