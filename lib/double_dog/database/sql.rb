module DoubleDog
  module Database
    class SQL

      class User < ActiveRecord::Base
        has_many :orders
      end

      class Item < ActiveRecord::Base
        belongs_to :order
        # has_many :orders
        has_many :order_items
        has_many :orders, :through => :order_items
      end

      class Order < ActiveRecord::Base
        # has_many :items
        belongs_to :user
        has_many :order_items
        has_many :items, :through => :order_items
      end

      class OrderItem < ActiveRecord::Base
        belongs_to :order
        belongs_to :item
      end

      # order = Order.find(id)
      # order.user #returns active record user

      # user = User.find(id)
      # user.orders #returns array of orders

      def create_user(attrs)
        ar_user = User.new
        ar_user.username = attrs[:username]
        ar_user.password = attrs[:password]
        ar_user.admin = attrs[:admin]
        ar_user.save
        user = DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def get_user(id)
        ar_user = User.find(id)
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password)
      end

      # def create_session(attrs)
      # end

      # def get_user_by_session_id(sid)
      # end

      def get_user_by_username(username)
        ar_user = User.find_by_username(username)
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def create_item(attrs)
        ar_item = Item.new
        ar_item.name = attrs[:name]
        ar_item.price = attrs[:price]
        ar_item.save
        item = DoubleDog::Item.new(ar_item.id, ar_item.name, ar_item.price)
      end

      def get_item(id)
        ar_item = Item.find(id)
        DoubleDog::Item.new(ar_item.id, ar_item.name, ar_item.price)
      end

      def all_items
        items = Item.all
      end

      # def all_items_in_order(id)
      #   items = OrderItem.find(id)
      # end

      def create_order(attrs)
        ar_order = Order.new
        ar_order.user_id = attrs[:employee_id]
        ar_order.save
        
        attrs[:items].each do |item|
          ar_order_item = OrderItem.new
          ar_order_item.order_id = ar_order.id
          ar_order_item.item_id = item.id
          ar_order_item.save
        end

        items_in_order = ar_order.items

        array = items_in_order.map{|item| DoubleDog::Item.new(item.id, item.name, item.price) }

        # items_in_order = all_items_in_order(ar_order.id)
        
        order = DoubleDog::Order.new(ar_order.id, ar_order.user_id, array)
      end

      def get_order(id)
        ar_order = Order.find(id)
        DoubleDog::Order.new(ar_order.id, ar_order.user_id, ar_order.items)
      end

      def all_orders
        orders = Order.all
      end

    end

  end

end