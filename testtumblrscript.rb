require "selenium-webdriver"

browser = Selenium::WebDriver.for :firefox
browser.get "https://www.tumblr.com"
login = browser.find_element class: "login-button"
login.click
email = browser.find_element id: "signup_email"
email.send_keys "larry.jonesmrfakeffakelarry-jones2015@hotmail.com"
password = browser.find_element id: "signup_password"
password.send_keys "BzZsjXjUTpIcq0w"
password.submit
textmenu = browser.find_element class: "icon_post_text"
textmenu.click
titlebox = browser.find_element class: "editor-plaintext"
titlebox.send_keys "This is a test"
textbox = browser.find_element class: "editor-richtext"
textbox.send_keys "This is a test"
post = browser.find_element class: "create_post_button"
post.click
browser.manage.timeouts.implicit_wait=(10)
titletest = browser.find_element class: "post_title"
if titletest.text == "This is a test"
  puts "Successesfully made post" 
else 
  raise "Failed to make post"
end
option = browser.find_element class: "creator"
option.click
delete = browser.find_element class: "delete"
delete.click
confirm = browser.find_element class: "btn_1"
confirm.click
browser.quit