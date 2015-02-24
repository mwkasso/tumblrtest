require 'spec_helper'

  describe "Tumblrtest" do
    describe "Make a post in tumblr" do

      it "Make a post" do
      	tumb = Tumblrtest.new
      	tumb.load
      	tumb.login
        tumb.post
        tumb.browser.manage.timeouts.implicit_wait=(3)
        titletest = tumb.browser.find_element class: "post_title"
      	expect(titletest.text).to eq("This is a test")
        tumb.delete
        tumb.quitbrowser
      end
      it "Post should show up on front page" do
        tumb = Tumblrtest.new
        tumb.load
        tumb.login
        tumb.post
        tumb.browser.manage.timeouts.implicit_wait=(3)
        profile_button = tumb.browser.find_element id: "post_controls_avatar"
        profile_button.click
        tumb.browser.manage.timeouts.implicit_wait=(2)
        titletest = tumb.browser.find_element class: "post_title"
        expect(titletest.text).to eq("This is a test")
        close_blog_view = tumb.browser.find_element class: "ui_peepr_glass"
        tumb.delete
        tumb.quitbrowser
      end
      # it "Should delete the post" do
      #   tumb = Tumblrtest.new
      #   tumb.load
      #   tumb.login
      #   tumb.post
      #   tumb.browser.manage.timeouts.implicit_wait=(5)
      #   tumb.delete
      #   expect{titletest = tumb.browser.find_element class: "post_title"}.to raise_error
      #   tumb.quitbrowser
      # end
    end
  end