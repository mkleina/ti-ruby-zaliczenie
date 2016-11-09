class Contact < ApplicationRecord
    validates :name, presence: { message: 'Imię jest wymagane' }
    validates :surname, presence: false
    validates :phone,
        presence: { message: 'Numer telefonu jest wymagany' },
        numericality: { message: 'Numer telefonu musi składać się z samych cyfr' },
        length: { minimum: 9, maximum: 15, message: 'Numer telefonu powinien zawierać od 9 do 15 znaków' }
end
