class FileUpload < ApplicationRecord
  has_one_attached :file

  validates :name, :tags, :file, presence: true
  validates :tags, tags: true, presence: true
  validates :file, file: true, presence: true

  before_save :downcase_tags, on: :create

  private

  def downcase_tags
    tags.map(&:downcase!)
  end
end
