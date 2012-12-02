class UsersController < ApplicationController
  inherit_resources
  actions :show

  authorize_resource
end
