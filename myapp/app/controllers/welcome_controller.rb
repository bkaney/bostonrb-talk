class WelcomeController < ApplicationController
  def index
    render text: 'Welcome aboard'
  end
end
