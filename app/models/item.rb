class Item < ApplicationRecord
	has_many :paniers
	has_many :users, through: :paniers
end
