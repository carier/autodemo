class Part < ActiveRecord::Base
  belongs_to :car

  validates_presence_of :title, :retail_cost, :final_cost
  validates_length_of :title,
                      :minimum => 5,
                      :message => 'is at least 5 characters long.'
  validates_numericality_of :retail_cost, :final_cost
  validate :final_cost_must_be_lower_that_retail_cost

  named_scope :ascend_by_bonus, :order => "(retail_cost - final_cost) asc"
  named_scope :descend_by_bonus, :order => "(retail_cost - final_cost) desc"

  named_scope :bonus_gte, lambda { |gte| {
              :conditions => ["(retail_cost - final_cost) >= ?", gte]}}
  named_scope :bonus_lte, lambda { |lte| {
              :conditions => ["(retail_cost - final_cost) <= ?", lte]}}

  def display_offstock
    if offstock
      "Yes"
    else
      "No"
    end
  end

  def bonus
    retail_cost - final_cost
  end
  
protected
  def final_cost_must_be_lower_that_retail_cost
    errors.add(:final_cost, 'should be lower that retail cost' ) if retail_cost < final_cost
  end

end
