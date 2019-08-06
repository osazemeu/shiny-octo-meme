class FileUpload < ApplicationRecord
  validates :name, presence: true
  validates :tags, tags: true
end
