class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates :user, presence: true
  validates :activity, presence: true

  attr_accessor :start_date, :start_hour, :start_minute, :start_am_pm

  def start_date
    start_time.present? ? I18n.l(start_time, format: :slashes) : nil
  end

  def start_hour
    return unless start_time.present?
    start_time.hour < 11 ? start_time.hour + 1 : start_time.hour - 12
  end

  def start_minute
    start_time.present? ? start_time.min.to_s : nil
  end

  def start_am_pm
    return unless start_time.present?
    start_time.hour < 11 ? 'am' : 'pm'
  end

  def set_initial_time
    m = (0..45).step(15).to_a.sort{|a,b| (a - Time.now.min).abs <=> (b - Time.now.min).abs }.first
    t = Time.now
    self.start_time = t.change min: m
  end

end
