class Api::FilesController < ApplicationController
  DEFAULT_LIMIT = 10
  DEFAULT_OFFSET = 0

  def create
    file_upload = FileUpload.create!(permitted_params)
    render json: file_upload
  end

  def show
    plus, minus = [], []

    params[:tag_search_query].split(" ").each do |elem|
      elem.slice!(0) && plus.push(elem) if elem.first == "+"
      elem.slice!(0) && minus.push(elem) if elem.first == "-"
    end

    plus_string = plus.join(", ")
    minus_string = minus.join(", ")

    @result ||= if plus.length > 0 && minus.length > 0
                  FileUpload.where("tags @> ?", "{#{ plus_string }}").where.not("tags @> ?", "{#{ minus_string }}")
                elsif plus.length > 0
                  FileUpload.where("tags @> ?", "{#{ plus_string }}")
                elsif minus.length > 0
                  FileUpload.where.not("tags @> ?", "{#{ minus_string }}")
                else
                  # TODO: Throw an error
                end

    total_records = @result.size
    @data ||= @result.limit(DEFAULT_LIMIT).offset(offset)
    @related_tags ||= @result
      .pluck(:tags)
      .flatten
      .group_by{|e| e}
      .map { |k, v| {tag: k, file_count: v.length} }

    render json: { total_records: @result.size, related_tags: @related_tags, file_count: @data.count, records: @data}
  end

  private

  def offset
    page = params[:page].to_i
    page <= 1 ? 0 : (page - 1) * DEFAULT_LIMIT
  end

  def permitted_params
    params.permit(:name, :file, :tag_search_query, :page, tags: [])
  end
end
