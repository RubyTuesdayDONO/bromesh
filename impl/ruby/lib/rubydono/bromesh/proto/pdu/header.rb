module RubyDONO
  module Bromesh
    module Proto
      module PDU
        class Header
          VERSION = 0

          def initialize

          end

          attr_reader :version, :length, :tlvs

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
end
