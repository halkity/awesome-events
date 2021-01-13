# ユーザー作成
99.times do |n|
  user = Faker::Omniauth.github
  User.create!{
    provider: user[:provider],
    uid: user[:uid],
    name: user[:info][:nickname],
    image_url: user[:info][:image]
  }
end

# イベント作成
users = User.order(:created_at).take(6)
10.times do |n|
  users.each_with_index do |user, idx|
    user.created_events.create!(
      case n
      when 0 then name: "ランニング#{idx + 1}"
      when 1 then name: "テニス#{idx+1}"
      when 2 then name: "サッカー#{idx+1}"
      when 4 then name: "野球#{idx+1}"
      when 5 then name: "読書#{idx+1}"
      when 6 then name: "映画#{idx+1}"
      when 7 then name: "ファッション#{idx+1}"
      when 8 then name: "勉強#{idx+1}"
      when 9 then name: "パーティー#{idx+1}"
      end
      place: Faker::Address.state
      start_at: DateTime.new(2022, 12, n, 17)
      end_at: DateTime.new(2022, 12, n+1, 17)
      content: "参加してください"
    )
  end
end

# 参加のリレーション

# ランダムにユーザーを20件複数取得
# ランダムにユーザーを複数取得

# user_random_ids =(User.pluck(:id).sample(10))
# event_random_ids = Event.pluck(:id)
# events = Event.where.not()
#   users.each do |user|
#     user.tickets.build do |t|
#       t.event = event
#       t.comment = params[:ticket][:comment]
#     end
#   end

# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { User.pluck(:id)
# users = User.find |follower| follower.follow(user) }

