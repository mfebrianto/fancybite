class FeaturingItemInteractor

  attr_reader :featuring_item

  def initialize(params)
    @featuring_item = FeaturingItem.new
    @featuring_item.menu_item_id = params[:id]
    max_sequence = FeaturingItem.maximum('sequence') || 0
    @featuring_item.sequence = max_sequence + 1
  end

end