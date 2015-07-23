class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  
  validates :title,
  presence: true,
  length: {minimum: 10, maximum:100}

  validates :body,
  presence: true

end
