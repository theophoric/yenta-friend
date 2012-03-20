class ChickstudsController < ApplicationController
  # GET /chickstuds
  # GET /chickstuds.json
  def index
    @chickstuds = Chickstud.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @chickstuds }
    end
  end

  # GET /chickstuds/1
  # GET /chickstuds/1.json
  def show
    @chickstud = Chickstud.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @chickstud }
    end
  end

  # GET /chickstuds/new
  # GET /chickstuds/new.json
  def new
    @chickstud = Chickstud.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @chickstud }
    end
  end

  # GET /chickstuds/1/edit
  def edit
    @chickstud = Chickstud.find(params[:id])
  end

  # POST /chickstuds
  # POST /chickstuds.json
  def create
    @chickstud = Chickstud.new(params[:chickstud])

    respond_to do |format|
      if @chickstud.save
        format.html { redirect_to @chickstud, :notice => 'Chickstud was successfully created.' }
        format.json { render :json => @chickstud, :status => :created, :location => @chickstud }
      else
        format.html { render :action => "new" }
        format.json { render :json => @chickstud.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chickstuds/1
  # PUT /chickstuds/1.json
  def update
    @chickstud = Chickstud.find(params[:id])

    respond_to do |format|
      if @chickstud.update_attributes(params[:chickstud])
        format.html { redirect_to @chickstud, :notice => 'Chickstud was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @chickstud.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chickstuds/1
  # DELETE /chickstuds/1.json
  def destroy
    @chickstud = Chickstud.find(params[:id])
    @chickstud.destroy

    respond_to do |format|
      format.html { redirect_to chickstuds_url }
      format.json { head :no_content }
    end
  end
end
