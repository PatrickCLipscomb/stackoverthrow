FactoryGirl.define do
  factory(:question) do
    author('bacon@bacon.com')
    content('how am I here?')
    user_id(1)
  end
  factory(:user) do
    email('bacon@bacon.com')
    password('password')
    password_confirmation('password')
  end
end
