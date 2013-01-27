
module Fauna
  class User < Fauna::Model

    delegate :name=, :name, :user, :external_id=, :external_id, :email=, :password=, :to => :resource

    def self.init
      super
      @fields += ["data", "email", "password", "name", "external_id"]
    end

    def self.find_by_email(email)
      find_by("users", {"email" => email})
    end

    def self.find_by_external_id(external_id)
      find_by("users", {"external_id" => external_id})
    end

    def self.find_by_name(name)
      find_by("users", {"name" => name})
    end

    private

    def post
      Fauna::Client.post("users", resource.to_hash)
    end

    def put
      d = Fauna::Client.put(ref, resource.to_hash)
    end
  end
end
