class Market < ActiveRecord::Base
  has_many :vendors

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', '%#{search}%'])
    else
      find(:all)
    end
  end
end
