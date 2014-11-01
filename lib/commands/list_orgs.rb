class ListOrgs
  def initialize(cf_gateway)
    @cf_gateway = cf_gateway
  end

  def execute(username, password)
    result = @cf_gateway.as(username, password).do_get('/v2/organizations')
  end
end