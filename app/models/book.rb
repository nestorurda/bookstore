class Book < ApplicationRecord
    has_many :reserves  
    has_many :users, through: :reserves

    # scope :books_for_me, -> (user) { where(user_id: user.books.pluck(:books_id))}

end
