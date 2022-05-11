class Api::V1::DigitsController < ApplicationController
  def index
    render json: { digits: [Random.rand, Random.rand] }
  end
end
