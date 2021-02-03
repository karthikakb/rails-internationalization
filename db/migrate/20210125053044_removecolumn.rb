class Removecolumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :feedbacks, :author_en
    remove_column :feedbacks, :author_ru
    remove_column :feedbacks, :message_en
    remove_column :feedbacks, :message_ru
  end
end
