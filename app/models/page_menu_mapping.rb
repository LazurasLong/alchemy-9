class PageMenuMapping < ActiveRecord::Base
  belongs_to :page 
  belongs_to :menu
 
  validates :page_id, :menu_id, :page_position, :presence => true
  validates_uniqueness_of :menu_id, :scope => :page_position, :message => "Can't have the same page position as another page"
  validates_uniqueness_of :menu_id, :scope => :page_id
end
