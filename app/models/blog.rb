class Blog < ActiveRecord::Base
  validates :title, :body, presence: true
end
