class ItemsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @items = Item.where(:account_id => current_user.account.id).page(params[:page]).per(15)

    respond_to do |format|
      format.html
    end
  end

  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @item = Item.new
    @item.account_id = current_user.account.id

    respond_to do |format|
      format.html
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])
    @item.account_id = current_user.account.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :ok }
    end
  end
end
