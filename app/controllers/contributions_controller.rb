class ContributionsController < ApplicationController
  # GET /contributions
  # GET /contributions.xml
  def index
    @contributions = Contribution.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contributions }
    end
  end

  # GET /contributions/1
  # GET /contributions/1.xml
  def show
    @Contribution = Contribution.find(params[:id])
    @items = @Contribution.items
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @Contribution }
    end
  end

  # GET /contributions/new
  # GET /contributions/new.xml
  def new
    @Contribution = Contribution.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @Contribution }
    end
  end

  # GET /contributions/1/edit
  def edit
    @Contribution = Contribution.find(params[:id])
  end

  # POST /contributions
  # POST /contributions.xml
  def create
    @Contribution = Contribution.new(params[:Contribution])

    respond_to do |format|
      if @Contribution.save
        flash[:notice] = 'Contribution was successfully created.'
        format.html { redirect_to(@Contribution) }
        format.xml  { render :xml => @Contribution, :status => :created, :location => @Contribution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @Contribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contributions/1
  # PUT /contributions/1.xml
  def update
    @Contribution = Contribution.find(params[:id])

    respond_to do |format|
      if @Contribution.update_attributes(params[:Contribution])
        flash[:notice] = 'Contribution was successfully updated.'
        format.html { redirect_to(@Contribution) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @Contribution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contributions/1
  # DELETE /contributions/1.xml
  def destroy
    @Contribution = Contribution.find(params[:id])
    @Contribution.destroy

    respond_to do |format|
      format.html { redirect_to(contributions_url) }
      format.xml  { head :ok }
    end
  end
end
