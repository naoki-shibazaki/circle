# frozen_string_literal: true

module AdminUserDecorator

  def first_user
    self.users.first
  end

end