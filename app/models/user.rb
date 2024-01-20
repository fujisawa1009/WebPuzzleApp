class User < ApplicationRecord
  before_create :generate_uuid
  validates :name, presence: true

  private
  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
