module RubyDONO
  module Bromesh
    module Proto
      class Wire
        def self.serialize(pdu)
          [pdu.header.version].pack('C')
        end
      end
    end
  end
end
