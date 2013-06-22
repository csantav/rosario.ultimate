class Page < ActiveRecord::Base
  attr_accessible :content, :header, :name


  def getContent name
  	find_by_name(name)
  end
end
