class Category < ActiveRecord::Base
  has_many :projects
  validates_presence_of :name, :message => "can't be blank"
  validates :name, uniqueness: true
  
  before_validation :white_space_remove
  before_validation :parse_white_spaces
  before_validation :always_downcase
  before_save :always_downcase
  
  def always_downcase
    name.to_s.downcase!
  end

  def white_space_remove
    write_attribute(:name, name.to_s.try(:strip))
  end

  def parse_white_spaces
    write_attribute(:name, name.to_s.gsub(/\s+/, ' '))
  end
  
end
