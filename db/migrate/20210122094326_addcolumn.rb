class Addcolumn < ActiveRecord::Migration[5.0]
  def change
    add_column :feedbacks, :author_en, :string
    add_column :feedbacks, :author_ru, :string
    add_column :feedbacks, :message_en, :string
    add_column :feedbacks, :message_ru, :string
  end
end
