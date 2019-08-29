class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    validates :name, {presence: true}
    validates :job, {presence: true}
    validates :profile, {presence: true}
    validates :password, {presence: true}
    validates :user_name, {presence: true, uniqueness: true}
    validates :image_name, {presence: true}
end
