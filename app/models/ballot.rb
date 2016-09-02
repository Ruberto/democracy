class Ballot < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :ip_address
  validates_uniqueness_of :ip_address

  validates :ip_address, presence: true, uniqueness: true, format: { with: Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex) }

  validate :topic_id_count
  validate :topic_ids_are_open_topics

  private

  def topic_ids_are_open_topics
    begin
      self.topic_ids.map {|id| Topic.open.find(id) }
    rescue ActiveRecord::RecordNotFound
      errors.add(:topic_ids, 'Needs to be open topics')
    end
  end

  def topic_id_count
    if self.topic_ids.length != 3
      errors.add(:topic_ids, 'Needs to be 3 topics only.')
    end
  end
end
