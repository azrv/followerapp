class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User", counter_cache: :followers_count

  validates :follower_id, uniqueness: { scope: :followed_id }
  validate :validate_self_following

  before_save :fix_counter_cache, :if => ->(er) { !er.new_record? && er.event_id_changed? }

  private
  def validate_self_following
    errors.add(:user, "Follower and followed can't be the same user!") if followed_id == follower_id
  end

  def fix_counter_cache
    User.decrement_counter(:followers_count, self.id)
    User.increment_counter(:followers_count, self.id)
  end

end
