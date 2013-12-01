class CombosController < ApplicationController
  before_filter :authenticate_tricker!, :except => [:show]
  # GET /combos
  # GET /combos.json
  def index
    collection = current_tricker.combos
    if params[:list]
      @list = List.find(params[:list])
      collection = @list.combos
    end
    @combos = collection.order(:no_tricks)
    @combos = collection.order(params[:sort]) if params[:sort]
    # @combos = @combos.page(params[:page]).per(10)
    
    get_tricks_for_all

    # get all my combos and their indices
    # get all database combos and their indices
    # assign each to a different collection, and paginate both of them in the index page
    # get_indices

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @combos }
    end
  end

  # GET /combos/1
  # GET /combos/1.json
  def show
    @combo = Combo.find(params[:id])
    
    get_tricks

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @combo }
    end
  end

  # GET /combos/new
  # GET /combos/new.json
  def new
    @combo = Combo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @combo }
    end
  end

  # GET /combos/1/edit
  def edit
    @combo = Combo.find(params[:id])
    get_tricks
    if !(current_tricker.id.equal? @combo.tricker_id) && !current_tricker.try(:admin?)
      respond_to do |format|
        format.html { redirect_to @combo, alert: 'You need admin privileges for that action!' }
        format.json { head :no_content }
      end
    end
  end

  # POST /combos
  # POST /combos.json
  def create
    @combo = Combo.create
    @combo.tricker_id = current_tricker.id

    remove_destroyed

    @combo.no_tricks = @trick_ids.length
    
    create_combo_elements

    update_lists

    respond_to do |format|
      if @combo.save
        format.html { redirect_to @combo, notice: 'Combo was successfully created.' }
        format.json { render json: @combo, status: :created, location: @combo }
      else
        format.html { render action: "new" }
        format.json { render json: @combo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /combos/1
  # PUT /combos/1.json
  def update
    @combo = Combo.find(params[:id]) 

    remove_destroyed

    @combo.no_tricks = @trick_ids.length

    # If after the editing the combo has < 2 tricks, return with error message
    if @combo.no_tricks < 2
      # REDIRECT TO EDIT PAGE WITH ERROR MESSAGE! BOOM!!!
      respond_to do |format|
        format.html { redirect_to edit_combo_path(@combo), alert: 'A combo must consist of at least two tricks!' }
        format.json { head :no_content }
      end
      return
    end

    # Delete all current combo elements, and recreate the new ones
    @combo.elements.delete_all

    create_combo_elements

    update_lists

    respond_to do |format|
      if @combo.save
        format.html { redirect_to @combo, notice: 'Combo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @combo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combos/1
  # DELETE /combos/1.json
  def destroy
    @combo = Combo.find(params[:id])
    @combo.destroy

    respond_to do |format|
      format.html { redirect_to combos_url, notice: 'Combo was successfully removed from the database.' }
      format.json { head :no_content }
    end
  end

  def generate_random
    @combo = Combo.create
    @combo.tricker_id = current_tricker.id

    # 1. randomly select number of tricks 
    @max_no_tricks = 10
    @no_tricks = rand(2..@max_no_tricks)
    @combo.no_tricks = @no_tricks

    # 2. randomly select the @no_tricks tricks
    if current_tricker.tricking_style.tricks.empty?
      # if no trick list is present, choose from all tricks in the database (admin's tricks & user created tricks)
      @collection = Trick.where(:tricker_id => [1, current_tricker.id])
    else
      # otherwise filter by tricker's style
      @collection = current_tricker.tricking_style.tricks
    end
    
    generate_and_redirect
  end

  def generate_custom # v1
    @combo = Combo.create
    @combo.tricker_id = current_tricker.id

    @filter = params[:filter]
    @no_tricks = params[:no_tricks].to_i
    @combo.no_tricks = @no_tricks

    if (@filter.eql?"database") || (current_tricker.tricking_style.tricks.empty?)
      # if no trick list is present, choose from all tricks in the database (admin's tricks & user created tricks)
      @collection = Trick.where(:tricker_id => [1, current_tricker.id])
    else
      # otherwise filter by tricker's style
      @collection = current_tricker.tricking_style.tricks
    end

    generate_and_redirect
  end

  def generate_options
  end

private

  def get_tricks
    @index = 1
    @tricks = []
    @combo.elements.length.times do
      @tricks << @combo.elements.where(:index=> @index).first.trick
      @index += 1
    end
  end

  def get_tricks_for_all
    @tricks_names = []
    @combos.each do |combo|
      @index = 1
      @tricks = []
      combo.elements.length.times do
        @tricks << combo.elements.where(:index=> @index).first.trick.name
        @index += 1
      end
      @tricks_names << @tricks
    end
  end

  def remove_destroyed
    @trick_ids = params[:combo][:trick_ids]
    @trick_ids.reject! { |c| c.empty? }
    @tricks_attributes = params[:combo][:tricks_attributes]

    # Formtastic submits some ridiculous parameters, especially for dynamically added/removed tricks
    # In the tricks_attributes hash, each trick in the combo has its own key and value
    @i = 0
    if @tricks_attributes
      @tricks_attributes.each do |key,value|
        # Value is also a hash. The "_destroy" key takes two values:
        # - "1" if the trick was deleted (which means the user clicked on the remove_nested_fields link), and
        # - "false" otherwise
        # What I do here is find which tricks from the provided trick_ids were destroyed,
        # and I mark them for deletion from the tricks involved in the combo
        if value[:_destroy].to_s == "1"  
          @trick_ids[@i] = ""
        end
        @i += 1
      end
    end
    # and here is how the delete happens... by eliminating empty values from trick_ids
    @trick_ids.reject! { |c| c.empty? }
  end

  def create_combo_elements
    # iterate through tricks added, and create all associations one by one!
    @index = 1
    @trick_ids.each do |id|
      Element.create(index: @index, combo_id: @combo.id, trick_id: id);
      @index += 1
    end
  end

  def update_lists
    @list_ids = params[:combo][:list_ids]
    @list_ids = @list_ids.reject! { |c| c.empty? }

    # when you play with indices in lists, you have to change this code!

    @combo.lists.each do |l|
      l.combos.delete(@combo)
    end

    @list_ids.each do |id|
      List.find(id).combos << @combo
    end
  end

  def generate_and_redirect
    @random = @collection.order("RANDOM()").map &:id
    @trick_ids = []
    @index = 0
    @no_tricks.times do
      @trick_ids << @random[@index]
      if @index < @collection.length-1
        @index += 1
      else
        # if the trick list has less tricks than @no_tricks, start over
        @index = 0
      end
    end

    # 3. create the combo elements for the randomly selected tricks
    create_combo_elements

    # 4. redirect to edit combo page.
    respond_to do |format|
      if @combo.save
        format.html { redirect_to edit_combo_path(@combo), notice: 'A '+@no_tricks.to_s+'-trick combo was successfully generated!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @combo.errors, status: :unprocessable_entity }
      end
    end
  end

end
