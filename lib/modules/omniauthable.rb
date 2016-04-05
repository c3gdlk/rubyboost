module Omniauthable
  extend ActiveSupport::Concern

  included do
    attr_accessor :social_login

    def self.find_or_create_with_oauth(oauth_data, user_data={})
      find_with_oauth(oauth_data) || create_with_oauth(oauth_data)
    end

    def self.find_with_oauth(oauth_data)
      find_through_authorization(oauth_data.provider, oauth_data.uid)
    end

    def self.find_through_authorization(service_name, uid)
      social_profile = SocialProfile.where(service_name: service_name, uid: uid).first
      social_profile.present? ? social_profile.user : nil
    end

    def self.create_with_oauth(oauth_data)
      first_name, last_name = oauth_data.extra.raw_info.name.split(' ')

      user = User.new(profile_attributes: { first_name: first_name, last_name: last_name })
      user.social_login = true

      user.save!

      user
    end

    def register_social_profile(service_name, uid)
      social_profile = SocialProfile.where(service_name: service_name, uid: uid).first_or_create
      if social_profile.user_id.present? && social_profile.user_id != id
        return false
      else
        social_profile.update!(user_id: id)
      end

      social_profile.persisted? ? social_profile : false
    end

    def password_required?
      return false if social_login
      super
    end

    def email_required?
      !social_login
    end

  end

end
