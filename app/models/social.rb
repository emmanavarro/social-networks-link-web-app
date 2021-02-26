class Social < ApplicationRecord
  belongs_to :user, optional: true

  validates :social_network_name,
            presence: true
  validates :profile_link,
            presence: true
end
