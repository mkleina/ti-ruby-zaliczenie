class Spec < ApplicationRecord
    has_many :contacts
    validates :name, presence: { message: 'Nazwa jest wymagane' }
    validates :name, presence: false
end
