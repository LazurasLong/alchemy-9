class Element < ActiveRecord::Base
  attr_accessible :name, :parent1, :parent2, :image

  belongs_to :father, class_name: "Element", foreign_key: :parent1
  belongs_to :mother, class_name: "Element", foreign_key: :parent2
  has_many :children1, class_name: "Element", foreign_key: :parent1
  has_many :children2, class_name: "Element", foreign_key: :parent2

  has_attached_file :image, :styles => { :small => "50x50#" }, :path => ':rails_root/public/elements/:id/:style/:filename', :url => "/elements/:id/:style/:filename"

  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => /image/
  
  #validates_uniqueness_of :parent1, :scope => :parent2, allow_nil: true
  #validates_uniqueness_of :parent2, :scope => :parent1, allow_nil: true
  
  validate :check_parent_uniqueness

  def check_parent_uniqueness
      element = Element.where("(parent1 = ? AND parent2 = ?) || (parent1 = ? AND parent2 = ?)", father, mother, mother, father).first
        errors.add(:duplicate_element_parents, "- Another element exists with the same parents") unless element.nil?
  end

  def parents
  	[father, mother].uniq
  end

  def children
  	[children1, children2].uniq
  end
end
