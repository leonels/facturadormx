class AccountsController < ApplicationController

  before_filter :authenticate_user!, :except => [:new, :create]

  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  def new
    @account = Account.new
    @account.users << User.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        user = @account.users[0]
        if user.active_for_authentication?
          # set_flash_message :notice, :signed_up if is_navigational_format?
          sign_in(:user, user)
          # respond_with user, :location => after_sign_up_path_for(user) 
          format.html { redirect_to dashboard_index_path, notice: 'Your account was successfully created.' }
        else
          # set_flash_message :notice, :"signed_up_but_#{user.inactive_message}" if is_navigational_format?
          # expire_session_data_after_sign_in!
          # respond_with user, :location => after_inactive_sign_up_path_for(user)
        end
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :ok }
    end
  end
end
