module DoubleDog
  module Auth
    def admin_session?(session_id)
      user = DoubleDog.db.get_user_by_session_id(session_id)
      user && user.admin?
    end
  end
end



