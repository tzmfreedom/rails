require "cases/helper"

module ActiveModel
  class AttributeReaderTest < ActiveModel::TestCase
    class ModelForAttributeReaderTest
      include ActiveModel::AttributeReader

      attr_reader :readable
    end

    class ModelForAttributeReaderWithActiveModelTest < ModelForAttributeReaderTest
      include ActiveModel::Model

      attr_accessor :accessable
    end

    test "properties assignment" do
      data = ModelForAttributeReaderTest.new(readable: 1)

      assert_equal 1, data.readable
    end

    test "properties with activemodel" do
      data = ModelForAttributeReaderWithActiveModelTest.new(readable: 1, accessable: 2)

      assert_equal 1, data.readable
      assert_equal 2, data.accessable
    end
  end
end
