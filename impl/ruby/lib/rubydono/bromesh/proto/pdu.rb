require 'rubydono/bromesh/proto/pdu/header'

module RubyDONO
  module Bromesh
    module Proto
      class PDU
        VERSION = 0

        attr_accessor :header, :body

        def initialize
          self.header = RubyDONO::Bromesh::Proto::Header.new
        end

        def body
        end

        private
        attr_writer :version
      end
    end
  end
end
