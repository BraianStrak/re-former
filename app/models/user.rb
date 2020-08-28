class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: {in: 3..20}
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 8}
end
    