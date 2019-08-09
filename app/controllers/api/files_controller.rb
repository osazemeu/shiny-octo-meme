class Api::FilesController < ApplicationController
  def create
    file_upload = FileUpload.create!(permitted_params)
    render json: file_upload, status: :ok
  end

  def show
    result = FileService::Finder.call(permitted_params)
    render json: result, status: :ok
  end

  private

  def permitted_params
    params.permit(:name, :file, :tag_search_query, :page, tags: [])
  end
end
