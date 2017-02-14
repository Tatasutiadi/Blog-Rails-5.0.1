class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook,:google_oauth2,:twitter]
  # change_column :accounts, :email, :string, :null => true
  has_many :articles

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.twitter_data"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauthFacebook(auth)
    puts auth.inspect
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.username = auth.info.first_ame,#auth.extra.raw_info.link.to_s.split('/').last,#auth.link.split('/').last,
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.from_omniauthTwitter(auth)
    # if email_required?
    #   false
    # end
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # user.email = 't'
      user.username = auth.info.nickname
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.from_omniauthGoogle(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

end
