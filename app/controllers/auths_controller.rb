class AuthsController < Doorkeeper::TokensController 
  def create
    response = authorize_response
    headers.merge! response.headers
    body = Rabl.render(nil, 'create', :view_path => 'app/views/auths/', :format => :json, locals:{data: response.body})
    self.response_body = body
    self.status = response.status
  rescue Errors::DoorkeeperError => e
    handle_token_exception e
  end
end