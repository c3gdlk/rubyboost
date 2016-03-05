class SocialProfile < ActiveRecord::Base
  belongs_to :user

  validates :service_name, :uid, presence: true
  validates :service_name, uniqueness: { scope: :user_id }
end
