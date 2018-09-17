class User < ApplicationRecord
    attr_accessor :password_confirmation
    has_many :posts
    has_many :comments
    validates_presence_of :username, :email, :password, :password_confirmation
    validates_confirmation_of :password
    validates_uniqueness_of :email, :username
end
