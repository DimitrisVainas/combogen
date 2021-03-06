module CombosHelper
  def combo_input_value(combo)
    unless combo.nil?
      combo.sequence.split(' > ').join(',')
    else
      ''
    end
  end

  def new_combo_anchor(trick_name)
    "new/#{@trick.name.gsub(' ', '_')}"
  end

  def available_styles_options
    styles = { "The Database" => "database" }
    if current_tricker.tricking_style.tricks.count > 0
      styles["My Trick List"] = "list"
    end
    styles
  end
  
  def my_tricks_for_selectize
    tricks = []
    current_tricker.tricking_style.tricks.each do |t|
      tricks << { name: t.name, type: 'list' }
    end
    tricks.to_json
    # current_tricker.tricking_style.tricks.map(&:name).join(',')
  end

  def db_tricks_for_selectize
    tricks = []
    (Trick.all - current_tricker.tricking_style.tricks).each do |t|
      tricks << { name: t.name, type: 'database' }
    end
    tricks.to_json
  end

  def my_lists_for_selectize
    lists = []
    current_tricker.lists.each do |list|
      lists << {name: list.name, num_combos: list.combos.count}
    end
    lists.to_json
  end

  def combo_date(combo)
    if DateTime.now - 1.week > combo.updated_at
      combo.updated_at.strftime('%b %-m') # %Y at %I:%M%P
    else
      "#{time_ago_in_words(combo.updated_at)} ago"
    end
  end
end
