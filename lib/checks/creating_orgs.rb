class CreatingOrgs
  def initialize(gateway)
    @gateway = gateway
  end

  def execute
    Given an organization named "Test"
    And a user named "OrgManager" with role "OrgManager" for organization "Test"
    When the user lists organizations
    Then the organization "Test" should be in the returned list
    end
  end
end