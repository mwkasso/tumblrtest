require 'spec_helper'

  describe "Tumblrtest" do
    describe "Make a post in tumblr" do
      it "Make a post" do
      	tumb = Tumblrtest.new
      	tumb.load
      	tumb.login
      	expect(tumb.post).to be true
      	tumb.delete
      	tumb.quitbrowser
      end
    end
  end