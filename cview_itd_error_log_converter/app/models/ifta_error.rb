require 'happymapper'
require_relative '../models/cview_transaction_summary'
require_relative '../models/cview_error_warning_statistics'
require_relative '../models/cview_processing_messages'
require_relative '../models/ifta_business_rule_warning'
require_relative '../models/ifta_business_rule_warning_keys'
require_relative '../models/ifta_business_rule_violation'
require_relative '../models/ifta_business_rule_violation_keys'



class IftaError
  include HappyMapper

  attr_accessor :date_received
  attr_accessor :transaction_summary
  attr_accessor :error_warning_statistics
  attr_accessor :processingMessages
  attr_accessor :business_rule_warnings
  attr_accessor :business_rule_warnings_keys
  attr_accessor :business_rule_violations
  attr_accessor :business_rule_violations_keys

  def initialize

  end
end