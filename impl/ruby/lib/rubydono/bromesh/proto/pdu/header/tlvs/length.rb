require 'rubydono/bromesh/proto/pdu/tlv'

module RubyDONO
  module Bromesh
    module Proto
      module PDU
        module TLVs
          class Length < RubyDONO::Bromesh::Proto::PDU::TLV
            def initialize(value)
              super nil, nil, value
            end

            attr_reader :version, :length, :tlvs

            def tlv!(tag, length, value)

            end

            def tlv(tag)
              return tlvs[tag.to_sym]
            end
          end
        end
      end
    end
  end
end
