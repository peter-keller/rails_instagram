class User < ApplicationRecord
  has_secure_password
  has_many :posts
  

  has_one_attached :avatar


  has_many :follower_follows, foreign_key: "followee_id", class_name: "Follower" 
  has_many :followers, through: :follower_follows

  has_many :followee_follows, foreign_key: "follower_id", class_name: "Follower"    
  has_many :followees, through: :followee_follows

  has_many :likes 
  has_many :comments
end
