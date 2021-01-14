# イベントカテゴリー
event_name_array = [
  "ランニング",
  "テニス",
  "サッカー",
  "ゴルフ",
  "野球",
  "読書",
  "映画",
  "ファッション",
  "勉強会",
  "飲食パーティー",
  "朝活",
]

event_level = [
  "（初心者OKです）",
  "（経験のある方でお願いします）",
  "（上級者の方向けです）",
]

# 参加コメント
comment = [
  "参加します！",
  "一緒にやりたいです",
  "暇なので",
  "( ^ω^ )",
  "初心者ですがよろしくお願いします！",
  "滑り込み参加",
  "さ・ん・か・し・ま・す",
]

# ユーザー作成
99.times do |n|
  user = Faker::Omniauth.github
  User.create!(
    provider: user[:provider],
    uid: user[:uid],
    name: user[:info][:nickname],
    image_url: user[:info][:image]
  )
end


# イベント作成
users = User.order(:created_at).take(30)
30.times do |n|
  users.each do |user|
    # event_arrayからランダムで一つ取り出す
    event_name = event_name_array.sample + event_level.sample
    # 月日時分をランダムで取得
    event_month = rand(1..12)
    event_day = rand(1..27)
    event_hour = rand(0..22)
    event_minute = rand(0..5) * 10
    # イベント作成処理
    user.created_events.create!(
      name: event_name,
      place: Faker::Address.state,
      start_at: DateTime.new(2022, event_month, event_day, event_hour, event_minute),
      end_at: DateTime.new(2022, event_month, event_day, event_hour + 1, event_minute),
      content: "参加してください"
    )
  end
end

# 参加のリレーション
# ランダムにユーザーを20件複数取得
users = User.all.sample(20).sort
# ユーザーを各個取り出す
users.each do |user|
  # 10個のイベント参加する
  10.times do
    rondom_comment = comment.sample
    # イベント取得
    join_event_ids = user.tickets.includes(:event).pluck(:event_id)
    if join_event_ids.empty?
      event = Event.where.not("owner_id = ?", user.id).sample
    else
      event = Event.where.not("id IN (?) OR owner_id = ?", join_event_ids, user.id).sample
    end
    # イベントへの参加処理
    user.tickets.create! do |t|
      t.event = event
      t.comment = rondom_comment
    end
  end
end