class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[update destroy]

  # GET /favorites or /favorites.json
  def index
    @favorites = current_user.items
  end

  # POST /favorites or /favorites.json
  def create
    @favorite = current_user.favorites.new(favorite_params)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to item_path(params[:item_id]), notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { redirect_to item_path(id: params[:item_id]), status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1 or /favorites/1.json
  def destroy
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to item_path(@favorite.item_id), notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def favorite_params
    params.permit(:item_id)
  end
end
