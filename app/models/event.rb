class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates :user, presence: true
  validates :activity, presence: true

  attr_accessor :start_date, :start_hour, :start_minute, :start_am_pm

  def self.for_user(u)
    return where('1 = 2') unless u.following_activities.present?
    joins(:activity).where(['ARRAY[activities.id] && ARRAY[?]', u.following_activities])
  end

  def self.current_and_future
    where('start_time >= ?', 1.hour.ago).order(:start_time)
  end

  def start_date
    start_time.present? ? I18n.l(start_time, format: :slashes) : nil
  end

  def start_hour
    return unless start_time.present?
    start_time.hour < 13 ? start_time.hour.to_s : (start_time.hour - 12).to_s
  end

  def start_minute
    start_time.present? ? start_time.min.to_s : nil
  end

  def start_am_pm
    return unless start_time.present?
    start_time.hour < 12 ? 'am' : 'pm'
  end

  def set_initial_time
    m = (0..45).step(15).to_a.sort{|a,b| (a - Time.now.min).abs <=> (b - Time.now.min).abs }.first
    t = Time.now
    self.start_time = t.change min: m
  end

end
