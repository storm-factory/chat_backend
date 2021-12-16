class ApiController < ApplicationController
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    respond_with '{"error": "not_found"}', status: :not_found
  end
end
