class EmailsController < ApplicationController
  # before_action :set_receiving student
  def new
  end

  def view
    @emails = Email.all
  end
end
