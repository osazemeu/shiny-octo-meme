module FileService
  class Search < ApplicationService
    DEFAULT_LIMIT = 10
    DEFAULT_OFFSET = 0

    def initialize(params)
      @params = params
    end

    def call
      polarity = polarity_checker
      search_query(polarity)
    end

    private

    def polarity_checker
      plus = []
      minus = []
      query_param = @params[:tag_search_query]

      raise Error::InvalidSearchRequest unless query_param.match?(/[\+\-]\w*/)

      query_param.split(" ").each do |elem|
        elem.slice!(0) && plus.push(elem) if elem.first == "+"
        elem.slice!(0) && minus.push(elem) if elem.first == "-"
      end

      {
        plus: plus,
        minus: minus,
      }
    end

    def offset
      page = @params[:page].to_i
      page <= 1 ? 0 : (page - 1) * DEFAULT_LIMIT
    end

    def related_tags
      @data
        .pluck(:tags)
        .flatten
        .group_by { |e| e }
        .map { |k, v| { tag: k, file_count: v.length } }
    end

    def result
      {
        total_records: @data.size,
        related_tags: related_tags,
        file_count: record_filter.count,
        records: record_filter,
      }
    end

    def record_filter
      @data.limit(DEFAULT_LIMIT).offset(offset)
    end

    def search_query(options)
      plus_string = options[:plus].join(", ")
      minus_string = options[:minus].join(", ")

      @data ||= if !options[:plus].empty? && !options[:minus].empty?
                  FileUpload.where("tags @> ?", "{#{plus_string}}").where.not("tags @> ?", "{#{minus_string}}")
                elsif !options[:plus].empty?
                  FileUpload.where("tags @> ?", "{#{plus_string}}")
                elsif !options[:minus].empty?
                  FileUpload.where.not("tags @> ?", "{#{minus_string}}")
                end

      raise ActiveRecord::RecordNotFound if @data.blank?

      result
    end
  end
end
