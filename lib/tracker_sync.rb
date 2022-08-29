class TrackerSync
  include HTTParty
  class NoProjectError < StandardError; end
  class ArgumentError < StandardError; end

  base_uri 'http://trackersync.localhost:4002/'
  headers 'Authorization' => 'tracker-sync-token',
          'Content-Type' => 'application/json'

  raise_on [500, 422, 406, 404, 403, 401, 400]
  format :json
  attr_reader :payload

  def initialize
    self.class.headers 'Accept-Language' => 'en'
  end

  def get_connections_iframe
    # wrong api token
    # @payload = { jwt: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWNyZXRfdG9rZW4iOiJxYV9zdXBlcm1hcmtldF9jbGllbnRfc2VjcmV0IiwidGVzdGlvX2FwaV90b2tlbiI6InNkZmFzZGYifQ.wq1pzBFwu_ybw6V0LtU0DPVnwQ2yrn1f3mhQnaljtWg' }

    #right valid params
    @payload = { jwt: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWNyZXRfdG9rZW4iOiJxYV9zdXBlcm1hcmtldF9jbGllbnRfc2VjcmV0IiwidGVzdGlvX2FwaV90b2tlbiI6ImFlOGRiMDIwYzA5OWUyODlkODliMzIzNGI2YjkzMTUwYmYyNDgxZjcifQ.RB3ZHVkM3kD_YePmNhA480DKiBYLI_OxzqpgWMMw07w' }
    self.class.get('/qa_supermarket/bug_trackers_configurations', body: payload.to_json )
  end

  def get_jira_iframe
    #right valid params
    @payload = { jwt: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1ZGM0MjY5YjdkY2YzOTBjNjE4NDg3NTkiLCJxc2giOiIyNTNhYjA4NmNjMzJhYWFkNGQ3NzBhNzc1MzRmODU4YTM4NTNjODJjZGI3NWU2OTIwNTQ3ZTMxYzhjYmQ5MjRjIiwiaXNzIjoiMTNhZGMzNWMtNTI3Ni0zNjcwLTk3OWMtZmJlYzIxNmRjOTJmIiwiY29udGV4dCI6e30sImV4cCI6MTY2MDIzMDU0NiwiaWF0IjoxNjYwMjI5NjQ2fQ.E_4F7aeHkG5e399v9LcWp9k7ZRuyZyu98VyngSA6PpA' }
    # binding.pry
    binding.pry
    self.class.get('/projects/10000/user_stories', body: payload.to_json )
  end
end
