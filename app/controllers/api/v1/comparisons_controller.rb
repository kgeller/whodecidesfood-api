class Api::V1::ComparisonsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create]

  respond_to :json

  def index
    # Return all comparisons unless the comparison_ids parameter is sent
    comparisons = params[:comparison_ids].present? ?
                  Comparison.find(params[:comparison_ids]) : Comparison.all
    respond_with comparisons
  end

  def show
    respond_with Comparison.find(params[:id])
  end

  def create
    comparison = current_user.comparisons.build(comparison_params)
    if comparison.save
      render json: comparison, status: 201, location: [:api, comparison]
    else
      render json: { errors: comparison.errors }, status: 422
    end
  end

  def update
    comparison = current_user.comparisons.find(params[:id])
    if comparison.update(comparison_params)
      render json: comparison, status: 200, location: [:api, comparison]
    else
      render json: { errors: comparison.errors }, status: 422
    end
  end

  def destroy
    comparison = current_user.comparisons.find(params[:id])
    comparison.destroy
    head 204
  end

  private

    def comparison_params
      params.require(:comparison).permit(:title)
    end
end
