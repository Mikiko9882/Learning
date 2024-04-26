# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Admin.create!(
  email: "admin@example.com",
  password: "12345678"
)

3.times do
  School.create!(
    name: Faker::Educator.secondary_school,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.subscriber_number(length: 10),
    email: Faker::Internet.email,
    website: Faker::Internet.url,
    code: Faker::Alphanumeric.alphanumeric(number: 8, min_alpha: 3)
  )
end

20.times do
  Teacher.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '12345678', # 仮のパスワード
    school_id: School.pluck(:id).sample, # 学校のIDは存在するIDからランダムに選択してください
  )
end


Grade.find_or_create_by!(name: "1年")
Grade.find_or_create_by!(name: "2年")
Grade.find_or_create_by!(name: "3年")

StudentClass.find_or_create_by!(name: "1組")
StudentClass.find_or_create_by!(name: "2組")
StudentClass.find_or_create_by!(name: "3組")
StudentClass.find_or_create_by!(name: "4組")
StudentClass.find_or_create_by!(name: "5組")
StudentClass.find_or_create_by!(name: "6組")
StudentClass.find_or_create_by!(name: "7組")
StudentClass.find_or_create_by!(name: "8組")
StudentClass.find_or_create_by!(name: "9組")
StudentClass.find_or_create_by!(name: "10組")

#ダミーuser
grades = Grade.all
student_classes = StudentClass.all

20.times do
  Student.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '12345678', # パスワードはダミーの値を設定してください
    school_id: School.pluck(:id).sample, # 学校のIDは存在するIDからランダムに選択してください
    grade: grades.sample,
    student_class: student_classes.sample
  )
end

#教科名
Subject.find_or_create_by!(subject_name: "国語")
Subject.find_or_create_by!(subject_name: "数学")
Subject.find_or_create_by!(subject_name: "理科")
Subject.find_or_create_by!(subject_name: "社会")
Subject.find_or_create_by!(subject_name: "英語")

#テストの種類
TestName.find_or_create_by(test_name: '中間テスト')
TestName.find_or_create_by(test_name: '期末テスト')
TestName.find_or_create_by(test_name: '実力テスト')
TestName.find_or_create_by(test_name: '小テスト')

#満点
MaxScore.find_or_create_by(max_score: '100')
MaxScore.find_or_create_by(max_score: '50')
MaxScore.find_or_create_by(max_score: '20')
MaxScore.find_or_create_by(max_score: '10')
MaxScore.find_or_create_by(max_score: '5')

test_names = TestName.all
max_score_value = 100
subjects = Subject.all

max_score = MaxScore.find_or_create_by(max_score: max_score_value)
30.times do |index|
  TestResult.create!(
    student_id: Student.pluck(:id).sample,
    test_name: test_names.sample,
    max_score: max_score,
    score: rand(max_score_value + 1),
    subject: subjects.sample,
    preparation_time_minutes: rand(300),
  )
end
