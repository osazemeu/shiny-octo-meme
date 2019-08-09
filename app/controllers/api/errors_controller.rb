class ErrorsController < ApplicationController
  def not_found
    render json: {
      status: :not_found,
      error: :not_found,
      message: "the requested object was not found",
    }, status: :not_found
  end

  def internal_server_error
    render json: {
      status: :internal_server_error,
      error: :internal_server_error,
      message: "request could not be completed due to an internal error",
    }, status: :internal_server_error
  end
end
