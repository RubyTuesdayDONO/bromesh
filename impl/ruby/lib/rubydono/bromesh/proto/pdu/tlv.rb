require 'rubydono/bromesh/proto/pdu/header/tlvs'

module RubyDONO
  module Bromesh
    module Proto
      module PDU
        class TLV
          def initialize(init_tag = nil, init_length = nil, init_value = nil)
            value = init_value
            length = init_length
            code! init_tag || self.class.name.split('::').last.downcase
          end

          attr_reader :value, :length, :code

          def code=(new_code)
            code! new_code
            @code
          end

          def code!(new_code)
            @code = catch(:code) do
              if new_code.nil?
                throw :code, nil
              else
                trial_code = Fixnum(new_code) rescue nil
                if trial_code
                  if (trial_code % 1) > 0
                    raise ArgumentError, "invalid non-integer TLV code '#{new_code}': " \
                                         "please specify an integer value -- " \
                                         "Bromesh won't round up or down for you"
                  else
                    if TLVs::CODES.value? trial_code
                      throw :code, trial_code.to_i
                    else
                      raise ArgumentError, "unknown TLV code '#{trial_code}': " \
                                           'please specify a valid protocol-defined code'
                    end
                  end
                else
                  trial_code = TLVs::CODES.find { |k, v| break v if k.to_s == new_code.to_s }
                  if trial_code
                    throw :code, trial_code
                  else
                    raise ArgumentError, "unknown TLV label '#{new_code}': " \
                                         'please specify a valid protocol-defined label'
                  end
                end
              end
            end
            return self
          end

          private
          attr_writer :value, :length
        end
      end
    end
  end
end
