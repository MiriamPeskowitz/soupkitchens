class Soupkitchen < ApplicationRecord
	has_many :users
	has_many :soupkitchen_comments
	has_many :comments, through: :soupkitchen_comments
	accepts_nested_attributes_for :comments, :allow_destroy => true, reject_if proc { |att| att['name'].blank? }
	accepts_nested_attributes_for :users, :allow_destroy => true

	validates_presence_of :name
end