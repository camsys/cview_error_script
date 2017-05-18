require 'happymapper'
class IrpBusinessRuleViolation
  include HappyMapper

  tag 'business_rule_violations'
  tag 'error'
  element :message, String, :tag => 'message'
end