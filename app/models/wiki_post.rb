#encoding: utf-8
class WikiPost < ActiveRecord::Base
  attr_accessible :name, :raw_text
  belongs_to :parent, :class_name => "WikiPost", :foreign_key => :parent_id
  has_many :children, :class_name => "WikiPost", :foreign_key => :parent_id

#  validate_presence_of :name
  validates_format_of :name, :with => /[a-zA-Z0-9\_А-Яа-я]+$/
  

  before_save :process_raw_text

  def self.find_by_path(path)
    target_post = nil
    for p in path.split("/").compact.select{|s| !s.blank? }
       target_post = WikiPost.where(:name => p).where(:parent_id => target_post.nil? ? nil : target_post.id).first
    end
    target_post
  end

  def get_path()
    if (self.new_record?)
      return ""
    else
      self.parent.nil? ? ("/" + self.name) : (parent.get_path() + "/" + self.name)
    end
  end

  protected
  def process_raw_text()
    self.processed_text = SimpleWiki::MarkupProcessor.process(self.raw_text.to_s)
  end
end
