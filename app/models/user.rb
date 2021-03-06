class User < ActiveRecord::Base
  has_many :articles
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :lockable
  attr_accessor :login
  validates :username, uniqueness: { case_sensitive: false }

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions)
      .where(['lower(username) = :value OR lower(email) = :value',
              { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
