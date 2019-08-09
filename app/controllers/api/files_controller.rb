class Api::FilesController < ApplicationController
  def create
    file = FileService::Upload.call(permitted_params)
    render json: file, status: :ok
  end

  def show
    search = FileService::Search.call(permitted_params)
    render json: search, status: :ok
  end

  private

  def permitted_params
    params.permit(:name, :file, :tag_search_query, :page, tags: [])
  end
end
