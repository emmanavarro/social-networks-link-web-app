class User < ApplicationRecord
  has_many :socials, dependent: :destroy
  accepts_nested_attributes_for :socials, allow_destroy: true, reject_if: proc { |att| att['profile_link'].blank? }
end
