def login
  visit admin_path

  fill_in "Username", with: "Admin"
  fill_in "Password", with: "password"
  click_on "Login"
end
