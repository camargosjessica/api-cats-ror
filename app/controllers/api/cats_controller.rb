class Api::CatsController < ApplicationController
  before_action :set_cat, only: %i[ show update destroy ]

  # GET /cats
  def index
    @cats = Cat.all.sorted_by_id

    render json: @cats
  end

  # GET /cats/1
  def show
    render json: @cat
  end

  # POST /cats
  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      render json: @cat, status: :created, location: api_cat_url(@cat)
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cats/1
  def update
    if @cat.update(cat_params)
      render json: @cat
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cats/1
  def destroy
    if @cat.destroy
      render json: "Id #{@cat.id} was deleted", status: :accepted
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cat_params
      params.require(:cat).permit(:name)
    end
end
