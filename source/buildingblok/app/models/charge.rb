class Charge < ActiveRecord::Base
  belongs_to :chargeable, polymorphic: true

  after_initialize :set_unique_code

  CODE_LENGTH = 32

  private

  def set_unique_code
    self.unique_code ||= generate_unique_code
  end

  def generate_unique_code
    SecureRandom.hex(CODE_LENGTH)
  end
end
