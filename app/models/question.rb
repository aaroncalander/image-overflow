class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates :img_link, presence: true
end
