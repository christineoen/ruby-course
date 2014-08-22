module Honkr
  module Databases
    class SQL

      class User < ActiveRecord::Base
        has_many :honks
      end

      class Honk < ActiveRecord::Base
        belongs_to :user
      end

      def persist_honk(honk)
        ar_honk = Honk.new
        ar_honk.user_id = honk.user_id
        ar_honk.content = honk.content
        ar_honk.save
        honk_id = ar_honk.id
        honk.instance_variable_set("@id", honk_id)
      end

      def get_honk(id)
        ar_honk = Honk.find(id)
        Honkr::Honk.new(ar_honk.id, ar_honk.user_id, ar_honk.content)
      end

      def persist_user(user)
        ar_user = User.new
        ar_user.username = user.username
        ar_user.password_digest = user.password_digest
        ar_user.save
        user_id = ar_user.id
        user.instance_variable_set("@id", user_id)
      end

      def get_user(id)
        ar_user = User.find(id)
        Honkr::User.new(ar_user.id, ar_user.username, ar_user.password_digest)
      end

      # TODO
      # TODO
      # TODO

    end
  end
end
