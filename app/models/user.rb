class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save { self.email = email.downcase }

  has_many :socials, dependent: :destroy
  accepts_nested_attributes_for :socials, allow_destroy: true,
                                          reject_if: proc { |att| att['profile_link'].blank? }

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true,
  #                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
  #                             message: 'must be a valid email address' },
  #                   length: { maximum: 100 }
  # validates :bio, presence: true,
  #                 length: { minimum: 30, maximum: 350 }

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize: '100x100'
  end

  # validate :image_type_confirmation

  # private

  # def image_type_confirmation
  #   accepted_types = ['image/png', 'image/jpeg']
  #   errors.add(:image, 'must be a PNG or JPEG file.') unless !image.attached? && image.content_type.in?(accepted_types)
  # end
end
