class BaseService
  private

  def fail(error)
    return { error: error, success?: false }
  end

  def response(result = nil)
    return { result: result, success?: true }
  end
end
