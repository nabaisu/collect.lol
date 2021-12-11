# frozen_string_literal: true

require_relative 'console_extensions'
require_relative 'facelift'

@support_facelift = SupportTools::Facelift.new

def fl(obj)
  relations = %i[flr flro].include? __callee__
  ordered = %i[flo flro].include? __callee__
  @support_facelift.facelift_object(obj, relations, ordered)
end

def flt(fields = [], records = [])
  @support_facelift.do_table(fields, records)
end

alias flo fl
alias flr fl
alias flro fl
