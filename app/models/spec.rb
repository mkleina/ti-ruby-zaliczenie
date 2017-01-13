class Spec < ApplicationRecord
    has_many :contacts, :dependent => :delete_all
    validates :name, presence: { message: 'Nazwa jest wymagane' }
    validates :name, presence: false
end
