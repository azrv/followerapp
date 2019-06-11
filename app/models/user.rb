class User < ApplicationRecord
  belongs_to :group

  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships

  def follow(user_id)
    Relationship.create(follower_id: id, followed_id: user_id)
  end

  def unfollow(user_id)
    Relationship.where(follower_id: id, followed_id: user_id).first.destroy
  end

  def follows?(user_id)
    Relationship.where(follower_id: id, followed_id: user_id).present?
  end
end
