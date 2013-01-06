class User < ActiveRecord::Base
  rolify

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :avatar_url, :bio, :email, :screen_name
  
  has_many :bleats, :order => "created_at DESC"
  has_many :authorizations, :dependent => :destroy
  
  validates :screen_name, :uniqueness => true, :presence => true
  validates :email, :presence => true, :uniqueness => true
  
  before_save :default_values
  
  def self.from_omniauth(auth_hash)
    authorization = Authorization.from_omniauth(auth_hash)
    if authorization.persisted?
      authorization.user
    else
      user = self.send("from_#{auth_hash.provider}", auth_hash)
      user.authorizations.push(authorization)
      user
    end
  end
  
  def self.from_facebook(auth_hash)
    new :screen_name => auth_hash.info.nickname, :email => auth_hash.info.email
  end
  
  def self.from_github(auth_hash)
    new :screen_name => auth_hash.info.name, :email => auth_hash.info.email
  end
  
  def self.from_developer(auth_hash)
    new :screen_name => auth_hash.info.name, :email => auth_hash.info.email
  end
  
  def self.new_with_session(params, session)
    if session["devise.auth_hash"]
      user = from_omniauth(session["devise.auth_hash"])
      user.attributes = params
      user.valid?
      user
    else
      super
    end
  end
  
  def password_required?
    super && !authorizations.any?
  end

  def default_values
    self.avatar_url ||= 'default_user.png'
  end
  
  def admin?
    self.has_role? :admin or self.has_role? :moderator
  end
  
  scope :active, where('last_sign_in_at > ?', Date.today - 30)
end
