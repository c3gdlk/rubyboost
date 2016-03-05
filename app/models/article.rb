class Article < ActiveRecord::Base
  belongs_to :project

  validates :title, :content, presence: true
end
