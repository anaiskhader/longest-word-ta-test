class PartiesController < ApplicationController
  before_action :authenticate_user!

  def new
    if Game.last.nil? || Game.last.parties.count >= 5
      @game = Game.create(user: current_user)
    else
      @game = Game.last
    end

    @partie = Partie.new(game: @game)
    @ten_letters_list = @partie.generate_ten_letter_list
  end

  def create
    if Game.last.nil? || Game.last.parties.count >= 5
      @game = Game.create(user: current_user)
    else
      @game = Game.last
    end

    @partie = Partie.new(partie_params)
    @partie.game = @game
    @ten_letters_list = @partie.generate_ten_letter_list

    if @partie.save
      redirect_to game_party_path(@game, @partie)
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:game_id])
    @partie = Partie.find(params[:id])
    @ten_letters_list = @partie.generate_ten_letter_list
  end

  private

  def partie_params
    params.require(:partie).permit(:word)
  end
end
