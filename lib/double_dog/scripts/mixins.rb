module Admin

  def admin_session?(session_id)
    user = DoubleDog.db.get_user_by_session_id(session_id)
    user && user.admin?
  end

end

module FailureSuccess

  private

    def failure(error_name)
      return :success? => false, :error => error_name
    end

    def success(data)
      return data.merge(:success? => true)
    end

end


