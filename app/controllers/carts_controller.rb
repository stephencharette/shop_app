class CartsController < ApplicationController
  before_action :authorize_user_logged_in
  before_action :set_cart, only: %i[show edit update destroy]
  before_action :authorize_admin, only: %i[index show]
  before_action :authorize_cart_belongs_to_user, only: %i[edit]

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show; end

  # GET /carts/1/edit
  def edit; end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = current_user.cart
  end

  def authorize_cart_belongs_to_user
    current_user.cart
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.fetch(:cart, {})
  end
end
