class FirstScreensController < ApplicationController
  include SessionsHelper
  def firstScreen
    $session_complete = false
  end

  def secondScreen
  end
end
