class User < ActiveRecord::Base

  ## Devise block

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  # Virtual attribute for authenticating by either username or email
  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where_clause = ["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]
      where(conditions).where(where_clause).first
    else
      where(conditions).first
    end
  end

  ## oauth

  has_many :oauth_access_grants, :dependent => :delete_all # TODO: or destroy_all?

  ## Validations

  attr_accessible :name, :superuser

  # format: alphanumeric and '_', with '-' only in the center
  validates :username, :presence => true,
    :uniqueness => { :case_sensitive => false },
    :format => /^[a-zA-Z\d_]+[a-zA-Z\d_-]*[a-zA-Z\d_]+$/,
    :length => { :minimum => 3 }

  validates :email, :presence => true,
    :uniqueness => true

  validates :name, :presence => true

  ## Methods

  # Returns true if the user is anonymous (not registered)
  def anonymous?
    self.new_record?
  end

end
