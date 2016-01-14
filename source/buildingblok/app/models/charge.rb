class Charge < ActiveRecord::Base
  belongs_to :chargeable, polymorphic: true

  after_initialize :set_unique_code

  validates_presence_of :chargeable, :amount

  CODE_LENGTH = 32

  def global_chargeable
    self.chargeable.to_global_id if self.chargeable.present?
  end

  def global_chargeable=(chargeable)
    self.chargeable = GlobalID::Locator.locate chargeable
  end

  private

  def set_unique_code
    self.unique_code ||= generate_unique_code
  end

  def generate_unique_code
    SecureRandom.hex(CODE_LENGTH)
  end
end
