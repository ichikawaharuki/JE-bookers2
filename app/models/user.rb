class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_one_attached :profile_image
  
  def self.ransackable_attributes(auth_object = nil)
    ["age", "created_at", "email", "encrypted_password", "gender", "id", "introduction", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  validates :gender, inclusion: { in: %w(Male Female Other), allow_nil: true }
  # %wで""を省略
  
  def get_profile_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/png')
    end
    profile_image.variant(resize: size).processed
  end
end
