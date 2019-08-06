class CreateFileUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :file_uploads, id: :uuid do |t|
      t.string :name
      t.text :tags, array: true, default: [], null: false

      t.timestamps
    end
  end
end
