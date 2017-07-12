class User < ActiveRecord::Base
  
  validates :username, :presence => true, :uniqueness => {:case_sensitive => false}
  
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :authentication_keys => [:username]
  
  def login=(login)
    @login = login
  end

  def login
    @login || self.username
  end
  
end
