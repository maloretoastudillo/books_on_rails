class Book < ApplicationRecord
    has_many :messages
    has_one_attached :image
    
    enum category: [ :"Lectura complementaria", :"Texto de estudio" ]
    enum course: [ :"1° básico", :"2° básico", :"3° básico", :"4° básico", :"5° básico", :"6° básico", :"7° básico", :"8° básico", :"I Medio", :"II Medio", :"III Medio", :"IV Medio" ]

    paginates_per 12
    def dom
        self.where(category: 0)
    end

    def text
        self.where(category: 1)
    end
    
end
