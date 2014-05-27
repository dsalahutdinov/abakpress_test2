#encoding: utf-8
require 'spec_helper'

describe WikiPost do
  before(:each) do
    @wiki_post = WikiPost.new
  end

  it "should require name" do
    @wiki_post.name = nil
    @wiki_post.should_not be_valid
#    @wiki_post.errors.on(:name).should_not be_nil
  end

  it "should pass correct names" do
    @wiki_post.title = "correct title"
    @wiki_post.raw_text = "corrent raw text"
    combinations(["abcdefghijklmnopqrstuvwxzy", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "0123456789", "абвгдеёжзийклмнопрстуфхцчшщЪьэюя", "АБВГДЕЁЖЗИКЛМНОПРСТУФХЦЧШЩЪЬЭЮЯ", "_"]).each do |combination|
      @wiki_post.name = combination.join("")
      @wiki_post.should be_valid
    end
  end

  it "should faild incorrect names" do
    @wiki_post.title = "correct title"
    @wiki_post.raw_text = "corrent raw text"
    for inc in '!@#$%^&*().,'.split("")
      @wiki_post.name = "hello" + inc
      @wiki_post.should_not be_valid
    end
  end
  
  it "should process text" do
    @wiki_post.name = "name"
    
    @wiki_post.raw_text = "correct raw **text**"
    @wiki_post.save
    @wiki_post.processed_text.should == SimpleWiki::MarkupProcessor.process(@wiki_post.raw_text)
  end

  def combinations(array)
    m = array.length
    (1...2**m).map do | n |
      (0...m).select { | i | n[i] == 1 }.map { | i | array[i] }
    end
  end
end
