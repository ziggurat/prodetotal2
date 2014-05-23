json.user do
	json.id @user.id
	json.token @user.token
	json.facebookId @user.facebook_id
	json.name @user.name
end