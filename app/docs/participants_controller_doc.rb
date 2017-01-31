module ParticipantsControllerDoc extend Apipie::DSL::Concern

  def_param_group :participant do
    param :participant, Hash, :action_aware => true, :required => true do
      param :name, String, :required => true, :desc => "Name for the participant"
    end
  end

  api :GET, "/comparisons/:id/participants/", "Get all participants information for a comparison"
  header "Authorization", "Session authentication token for the user", :required => true
  def index
    # Stub
  end

  api :GET, "/comparisons/:comparison_id/participants/:id", "Get a participant information for a comparison by ID"
  header "Authorization", "Session authentication token for the user", :required => true
  param :comparison_id, :number, :desc => "Comparison ID"
  param :id, :number, :desc => "Participant ID", :required => true
  error 404, "Trying to access a participant that you don't have access to"
  def show
    # Stub
  end

  api :POST, "/comparisons/:comparison_id/participants", "Create a new participant for a comparison"
  param :comparison_id, :number, :desc => "Comparison ID"
  param_group :participant
  error 422, "Unable to create the participant (probably due to validation issues)"
  def create
    # Stub
  end

  api :PATCH, "/comparisons/:comparison_id/participants/:id", "Update an existing participant for a comparison"
  header "Authorization", "Session authentication token for the user", :required => true
  param :comparison_id, :number, :desc => "Comparison ID"
  param_group :participant
  error 422, "Unable to update the participant (probably due to validation issues)"
  def update
    # Stub
  end

  api :DELETE, "/comparisons/:comparison_id/participants/:id", "Delete an existing participant for a comparison"
  header "Authorization", "Session authentication token for the user", :required => true
  param :comparison_id, :number, :desc => "Comparison ID"
  param :id, :number, :desc => "User ID", :required => true
  def destroy
    # Stub
  end
end
