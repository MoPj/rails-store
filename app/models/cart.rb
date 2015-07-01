class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items

  def total
    # why doesn't :inject method below work?
    # self.line_items.inject { |total, line_item| total + (line_item.quantity * line_item.item.price) }  
    total = 0
    self.line_items.each do |line_item|
      total += line_item.quantity * line_item.item.price
    end
    total
  end

  def add_item(item_id)
    current_item = self.line_items.find_by(item_id: item_id)
    if current_item 
      current_item.quantity += 1
    else
      current_item = self.line_items.build(item_id: item_id)
    end
    current_item
    # if line_item.quantity default == 0
    # item = self.line_items.find_or_create_by(item_id: item_id)
    # line_item.quantity += 1
  end

end