class Project < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'users_id'
  belongs_to :category, class_name: 'Category', foreign_key: 'categories_id'
  
  validates :users_id, presence: true
  validates :categories_id, presence: true
  validates :title, presence: true
  
end
