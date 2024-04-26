class Student < ApplicationRecord
  belongs_to :school
  belongs_to :grade
  belongs_to :student_class
  has_many :test_results, dependent: :destroy

  validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def average_achievement_rate
    test_results.average(:achievement_rate)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "grade_id", "id", "id_value", "name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "school_id", "student_class_id", "updated_at"]
  end
end
