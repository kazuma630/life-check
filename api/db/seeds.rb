puts 'Creating todos...'

# 適当なUserを5つ作成
User.create([
  {nickname: "test太郎", birth_at: "1999-01-01"},
  {nickname: "test花子", birth_at: "1899-12-31"}
])

puts '...Done!'