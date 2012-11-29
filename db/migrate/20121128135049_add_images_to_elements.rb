class AddImagesToElements < ActiveRecord::Migration
  def change
    add_column :elements, :image_file_name, :string
    add_column :elements, :image_content_type, :string
    add_column :elements, :image_file_size, :integer
  end
end
