module ActiveModel
  module AttributeReader
    extend ActiveSupport::Concern

    def initialize(attributes = {})
      if self.class.attribute_readers
        self.class.attribute_readers.each do |attribute|
          next if respond_to?(:"#{attribute}=")

          value = attributes.delete(attribute)
          instance_variable_set(:"@#{attribute}", value)
        end
      end

      super
    end

    module ClassMethods
      def attr_reader(*vars)
        attribute_readers.concat(vars)
        super
      end

      def attribute_readers
        @@attribute_readers ||= []
      end
    end
  end
end
