class Feedback < ApplicationRecord
  validates :author, presence:true 
  validates :message, presence:true 
  include Mobility
  translates :author, type: :string
  translates :message, type: :string


 

  scope :search, -> (author_q) do
    i18n do
      author.lower.matches("%#{author_q.downcase}%")
    end
  end
end
