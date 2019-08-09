module FileService
  class Upload < ApplicationService
    def initialize(params)
      @params = params
    end

    def call
      create
    end

    def create
      FileUpload.create!(@params)
    end
  end
end
