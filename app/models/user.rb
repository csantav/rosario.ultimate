class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  has_and_belongs_to_many :roles
  validate :name, unique: true
  has_many :articles
  before_create :default_role

  def addRole role
    if role
      if role = Role.find_by_name(role)
        unless self.roles.include? role
          self.roles << role
          return 1
        end
        return 0 
      else
        return -1
      end
    end
  end

  def removeRole role
    if role
      if role = Role.find_by_name(role)
        if index = self.roles.index(role)
          self.roles.delete role
          return 1
        end
        return 0
      else
        return -1
      end
    end
  end


  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  private

  def default_role
    unless self.roles.first
      self.roles << Role.find_by_name('user')
    end
  end



end

