class FileUpload < ApplicationRecord
  has_one_attached :file

  validates :name, :tags, :file, presence: true
  validates :tags, tags: true, presence: true
  validates :file, file: true, presence: true
end
