class TestsController < ApplicationController

  def index
    @tests = Test.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tests }
    end
  end

  def show
    @test = Test.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test }
    end
  end

  def new
    @test = Test.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test }
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def create
    @test = Test.new(params[:test])

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render json: @test, status: :created, location: @test }
      else
        format.html { render action: "new" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @test = Test.find(params[:id])

    respond_to do |format|
      if @test.update_attributes(params[:test])
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy

    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end

  def new_group
    @group_name = Group.new

    respond_to do |format|
      format.html # new_group.html.erb
      format.json { render json: @group }
    end
  end

  def index_group
    @group_name = Group.all
  end

  def create_group
    @group_name = params[:group]
  end

  def save_group(group_name)
    @get_group = Group.create(:group_name => :group)
    @get_group.save
      if @get_group.save
        redirect_to show_group_path
        flash[:success]= "Group add"
      else
        flash[:alert] = "Error"
      end
  end

  def destroy_group
    @group = Group.find(:id).destroy
  end

end
