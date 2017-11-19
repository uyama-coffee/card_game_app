json.extract! mypage, :id, :created_at, :updated_at
json.url mypage_url(mypage, format: :json)
