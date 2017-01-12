class Clinic < ApplicationRecord
    has_many :contacts
    validates :name, presence: { message: 'Nazwa jest wymagana' }
    validates :city, presence: { message: 'Miasto jest wymagane' }
    validates :address, presence: { message: 'Adres jest wymagany' }
    validates :phone,
        presence: { message: 'Numer telefonu jest wymagany' },
        numericality: { message: 'Numer telefonu musi składać się z samych cyfr' },
        length: { minimum: 9, maximum: 15, message: 'Numer telefonu powinien zawierać od 9 do 15 znaków' }

    def full_name
        "#{name}: #{city}, #{address}"
    end
end
