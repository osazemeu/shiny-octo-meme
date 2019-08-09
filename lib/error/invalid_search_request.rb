module Error
  class InvalidSearchRequest < CustomError
    def initialize
      super(:invalid_search_request, 422, 'malformed search request')
    end
  end
end
