require 'spec_helper'

describe UrlShortner do
  
  it "should create the right object" do
    UrlShortner.new("www.google.com").should be_a(UrlShortner)
  end
  
  before :each do
    @url = "www.google.com"
    @shortner = UrlShortner.new("www.google.com")
    @url_key = @shortner.save
  end
  
  it "should save the object to the REDIS instance" do
    REDIS.get(@url_key).should == @url
  end
  
  it "should fetch the url" do
    UrlShortner.get_url(@url_key).should == @url
  end
  
end