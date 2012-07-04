class InvoicesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :load_resources, :only => [:new, :create, :edit, :update]

  def index
    @invoices = Invoice.where(:account_id => current_user.account.id).page(params[:page]).per(15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

 def new
    @invoice = Invoice.new
    3.times do
      line_item = @invoice.line_items.build
    end
    @invoice.account_id = current_user.account.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.account_id = current_user.account.id

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :ok }
    end
  end
  
  private
  
  def load_resources
    @clients = Organization.where(:account_id => current_user.account.id)
    @items = Item.where(:account_id => current_user.account.id)
  end
end
