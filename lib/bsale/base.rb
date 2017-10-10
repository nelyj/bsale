module Bsale
  class Base
    BASE_URL = "https://api.bsale.cl/v".freeze

    def to_h
      hash = self.instance_variables.each_with_object({}) { |v, h| h[v.to_s.delete("@")] = self.instance_variable_get(v) }
      hash.delete("connection")
      hash
    end

    def raise_if_invalid!(resp)
      raise ServerError, "Server Error" if resp.status > 499
      raise NotFoundError, "Not Found" if resp.status == 404
      raise UnauthorizedError, "Unauthorized request" if resp.status == 401
      raise AccessForbiddenError, "Access Forbidden" if resp.status == 403
    end
  end
end
