class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.filter_not_deleted
    where(deleted: false)
  end

  def mark_deleted
    self.update(deleted: true)
  end
end
