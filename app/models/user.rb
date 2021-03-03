class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save { self.email = email.downcase }

  has_many :socials, dependent: :destroy
  accepts_nested_attributes_for :socials, allow_destroy: true,
                                          reject_if: proc { |att| att['profile_link'].blank? }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                              message: 'must be a valid email address' },
                    length: { maximum: 100 }
  validates :bio, presence: true,
                  length: { minimum: 30, maximum: 350 }

  has_one_attached :image do |attachable|
    attachable.variant :thumbnail, resize_to_fill: '100x100'
  end

  validates :image, presence: true
end
