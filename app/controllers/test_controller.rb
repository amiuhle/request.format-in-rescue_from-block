class TestController < ApplicationController

  before_filter only: [:throw] do
    raise "Some error"
  end

  rescue_from StandardError, with: :standard_error

  def index
  end

  def throw
  end

  private

  def standard_error error
    @error = error
    render 'error' #, formats: request.format
  end

end
