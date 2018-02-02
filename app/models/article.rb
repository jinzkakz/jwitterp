class Article < ApplicationRecord
  validates :name, presence: true
  validates :author, presence: true
  validates :content, presence: true
    belongs_to :user
    
    def self.search(articles)
        if articles 
            where("name LIKE ? OR author LIKE ? OR content LIKE ?", "%#{articles}%", "%#{articles}%", "%#{articles}%")
        else
            all
        end
    end
end
