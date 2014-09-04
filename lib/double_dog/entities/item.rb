module DoubleDog
  class Item
    attr_reader :id, :name, :price

    def initialize(id, name, price)
      @id = id
      @name = name
      @price = price
    end

    # def ==(other_item)
    #   self.id == other_item.id && self.name == other_item.name && self.price == other_item.price
    # end
  end
end