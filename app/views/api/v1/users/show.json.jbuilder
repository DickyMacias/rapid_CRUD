json.data do
  json.user do
    json.id @user.id
    json.username @user.username
    # json.first_name @user.first_name
    # json.last_name @user.last_name
    # json.video 'Esta es una prueba de concepto'
  end
end