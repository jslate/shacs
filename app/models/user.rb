class User < ActiveRecord::Base

  has_many :events, dependent: :destroy

  validates :name, presence: true

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end

  def follow(activity)
    return if is_following?(activity)
    update_attributes following_activities: following_activities + [activity.id]
  end

  def unfollow(activity)
    return unless is_following?(activity)
    update_attributes following_activities: following_activities - [activity.id]
  end

  def is_following?(activity)
    following_activities.present? && following_activities.include?(activity.id)
  end

end
