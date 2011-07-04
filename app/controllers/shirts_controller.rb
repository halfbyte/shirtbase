class ShirtsController < ApplicationController
  
  before_filter :load_scope
  
  before_filter :ensure_owner, :only => [:edit, :update, :destroy]
  
  before_filter :login_required!, :only => [:create, :update, :new, :edit, :destroy]
  
  # GET /shirts
  # GET /shirts.json
  def index
    @shirts = @scope.all
    puts @shirts.inspect

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shirts }
    end
  end

  # GET /shirts/1
  # GET /shirts/1.json
  def show
    @shirt = @scope.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shirt }
    end
  end

  # GET /shirts/new
  # GET /shirts/new.json
  def new
    @shirt = Shirt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shirt }
    end
  end

  # GET /shirts/1/edit
  def edit
    @shirt = @scope.find(params[:id])
  end

  # POST /shirts
  # POST /shirts.json
  def create
    @shirt = @scope.new(params[:shirt])
    if params[:transloadit]
      image = ShirtImage.from_transloadit(JSON.parse(params[:transloadit]))
      @shirt.shirt_images << image if image
    end
    @shirt.user = current_user

    respond_to do |format|
      if @shirt.save
        format.html { redirect_to @shirt, notice: 'Shirt was successfully created.' }
        format.json { render json: @shirt, status: :created, location: @shirt }
      else
        format.html { render action: "new" }
        format.json { render json: @shirt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shirts/1
  # PUT /shirts/1.json
  def update
    @shirt = @scope.find(params[:id])
    if params[:transloadit]
      image = ShirtImage.from_transloadit(JSON.parse(params[:transloadit]))
      @shirt.shirt_images << image if image
    end

    respond_to do |format|
      if @shirt.update_attributes(params[:shirt])
        format.html { redirect_to @shirt, notice: 'Shirt was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @shirt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shirts/1
  # DELETE /shirts/1.json
  def destroy
    @shirt = @scope.find(params[:id])
    @shirt.destroy

    respond_to do |format|
      format.html { redirect_to shirts_url }
      format.json { head :ok }
    end
  end

  def load_scope
    if params[:user_id]
      @user = User.find(params[:user_id])
      @scope = @user.shirts
    else
      @scope = Shirt
    end    
  end
  
  def ensure_owner
    @user && @user == current_user
  end
  
end
