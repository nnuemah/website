class ConversationsController < ApplicationController
  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @conversations }
    end
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conversation }
    end
  end

  # GET /conversations/new
  # GET /conversations/new.json
  def new
    @conversation = Conversation.new
    @comment = @conversation.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conversation }
    end
  end

  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(params[:conversation])
    @comment = @conversation.comments.build(params[:comment])

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render json: @conversation, status: :created, location: @conversation }
      else
        format.html { render action: "new" }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /conversations/1/reply
  # GET /conversations/1/reply.json
  def reply
    @conversation = Conversation.find(params[:id])
    @comment = @conversation.comments.build

    respond_to do |format|
      format.html # reply.html.erb
      format.json { render json: @conversation }
    end
  end

  # POST /conversations/1/reply
  # POST /conversations/1/reply.json
  def save_reply
    if Conversation.exists?(params[:id])
      @conversation = Conversation.find(params[:id])
      @comment = @conversation.comments.build(params[:comment])
    else
      redirect_to(conversations_path, :notice => "Please select a valid conversation")
    end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(conversations_path(@conversation), :notice => "Your comment was posted")}
      else
        format.html {render :action => "new"}
      end
    end
  end

  # PUT /conversations/1
  # PUT /conversations/1.json
  def update
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      if @conversation.update_attributes(params[:conversation])
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to conversations_url }
      format.json { head :no_content }
    end
  end
end
