class Contact < ApplicationRecord
    belongs_to :clinic, optional: true
    belongs_to :spec, optional: true
    validates :name, presence: { message: 'Imię jest wymagane' }
    validates :surname, presence: false
    validates :phone,
        presence: { message: 'Numer telefonu jest wymagany' },
        numericality: { message: 'Numer telefonu musi składać się z samych cyfr' },
        length: { minimum: 9, maximum: 15, message: 'Numer telefonu powinien zawierać od 9 do 15 znaków' }
    validates :clinic_id, presence: { message: 'Przychodnia jest wymagana' }
    validates :spec_id, presence: { message: 'Specjalizacja medyczna jest wymagana' }
    
    def full_name
        "#{name} #{surname}"
    end
end
