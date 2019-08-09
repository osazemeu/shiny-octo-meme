class ErrorsController < ApplicationController
  def not_found
    render json: {
      status: 404,
      error: :not_found,
      message: 'the requested object was not found'
    }, status: 404
  end

  def internal_server_error
    render json: {
      status: 500,
      error: :internal_server_error,
      message: 'request could not be completed due to an internal error'
    }, status: 500
  end
end
