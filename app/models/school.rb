class School < ApplicationRecord
  before_validation :generate_unique_code, on: :create

  has_many :teachers, dependent: :destroy
  has_many :students, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/}
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}
  validates :website, format: { with: URI::DEFAULT_PARSER.make_regexp}, allow_blank: true

  validates :code, presence: true, uniqueness: true

  def generate_unique_code
    loop do
      self.code = SecureRandom.hex(4)
      break unless School.exists?(code: code)
    end
  end
end
