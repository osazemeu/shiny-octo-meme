class AddTagIndexToFileUploads < ActiveRecord::Migration[5.2]
  def change
    add_index  :file_uploads, :tags, using: 'gin'
  end
end
