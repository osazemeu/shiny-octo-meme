class Api::FilesController < ApplicationController
  def create
    file_upload = FileUpload.create!(permitted_params)
    render json: file_upload
  end

  def show
  end

  def permitted_params
    params.permit(:name, :file, tags: [])
  end
end
