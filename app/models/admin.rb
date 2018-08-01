class Admin < ActiveRecord::Base

  before_save :create_remember_token

  has_many :posts

  has_secure_password

  validates :username,  presence: true, length: { minimum: 5 }

  validates :password, length: { minimum: 6 }, :on => :create, allow_blank: true
  validates :password_confirmation, presence: true, :on => :create

  # Returns the hash digest of the given string.
  def Admin.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Admin.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private

  def create_remember_token
    self.remember_token = Admin.new_token
  end
end
