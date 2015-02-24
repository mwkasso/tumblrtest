require "selenium-webdriver"

class Tumblrtest
  attr_accessor :browser
  #Loads firefox and navigates to tumblr website
  def load
    @browser = Selenium::WebDriver.for :firefox
    @browser.get "https://www.tumblr.com"
  end

  # Logs in to tumblr using a test account
  def login
    login = @browser.find_element class: "login-button"
    login.click
    email = @browser.find_element id: "signup_email"
    email.send_keys "larry.jonesmrfakeffakelarry-jones2015@hotmail.com"
    password = @browser.find_element id: "signup_password"
    password.send_keys "BzZsjXjUTpIcq0w"
    password.submit
  end

  # Creates a test post
  def post
    textmenu = @browser.find_element class: "icon_post_text"
    textmenu.click
    titlebox = @browser.find_element class: "editor-plaintext"
    titlebox.send_keys "This is a test"
    textbox = @browser.find_element class: "editor-richtext"
    textbox.send_keys "This is a test"
    post = @browser.find_element class: "create_post_button"
    post.click
    
    # profile_button = browser.find_element id: "post_controls_avatar"
    # profile_button.click
  end
   
  # Deletes the post
  def delete
    option = @browser.find_element class: "creator"
    option.click
    delete = @browser.find_element class: "delete"
    delete.click
    confirm = @browser.find_element class: "btn_1"
    confirm.click
  end

  # Closes the driver and browser
  def quitbrowser
    @browser.quit
  end
end
