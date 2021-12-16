class ChatSessionsController < ApiController
  before_action :set_user, only: [:index]

  def create
    ##
    #This action would also leverage the chat_peers_params to create a new chat session object with the specified chat_peers
    #and open a websockets connection to the online peers.
    #
    #The ChatSession model could leverage Redis to create an in memory representaion of the chat body and append messages
    #to the body in the format as outlined in the seeds file as they come in.
    #
    #This body could then be sent to the chat clients as JSON and they could process and display the messages as they saw fit.
    #
    #When the chat websocket connection was closed then the data could be pulled out of redis and persisted to the database via the ORM.
  end

  def index
    chat_sessions = @user.chat_sessions
    if chat_session_index_params.has_key? :chat_peers
      chat_sessions = chat_sessions.joins(:users).where("users.id" => chat_session_index_params[:chat_peers].split(","))
    end

    respond_to do |format|
      format.json {
        render json: {chat_sessions: chat_sessions}
      }
    end
  end

  protected
    def chat_session_index_params
      params.permit(:chat_peers)
    end

  protected
    def set_user
      @user = nil
      if params.has_key? :user_id
        @user = User.find(params[:user_id])
      end
    end
end
