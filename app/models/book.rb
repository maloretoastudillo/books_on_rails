class Book < ApplicationRecord
    has_many :messages
    has_one_attached :image
    
    enum category: [ :"Lectura complementaria", :"Texto de estudio" ]

    enum course: [ :"1° básico", :"2° básico", :"3° básico", :"4° básico", :"5° básico", :"6° básico", :"7° básico", :"8° básico", :"I Medio", :"II Medio", :"III Medio", :"IV Medio" ]

end
