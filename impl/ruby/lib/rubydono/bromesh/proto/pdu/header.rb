module RubyDONO
  module Bromesh
    module Proto
      class Header
        VERSION = 0

        def initialize

        end

        def version
          @version || VERSION
        end

        attr_reader :length, :tlvs

        def tlv!(tag, length, value)

        end

        def tlv(tag)
          return tlvs[tag.to_sym]
        end

        private
        attr_writer :version, :tlvs
      end
    end
  end
end
