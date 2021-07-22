class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Arel simplified syntax
  def self.[](attribute)
    arel_table[attribute]
  end
end
