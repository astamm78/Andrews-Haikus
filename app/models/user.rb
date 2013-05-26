class User < ActiveRecord::Base

  has_many :likes
  has_many :haikus, :through => :likes

  include BCrypt

  validates :email, :presence => true, :format => {:with =>  /\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3}/},
            :uniqueness => true
  validates :password, :presence => true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.create(params={})
    @user = User.new(:email => params[:email], :full_name => params[:full_name])
    @user.password = params[:password]
    @user.save!
    @user
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    (user && user.password == password) ? true : false
  end

end
