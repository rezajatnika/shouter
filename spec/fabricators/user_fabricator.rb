Fabricator(:user) do
  username 'foobar'
  email    'foo@bar.baz'
  password 'secretpass'
  password_confirmation 'secretpass'
end
