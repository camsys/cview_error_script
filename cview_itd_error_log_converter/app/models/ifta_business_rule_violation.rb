require 'happymapper'
class IftaBusinessRuleViolation
  include HappyMapper

  tag 'business_rule_violations'
  tag 'error'
  element :message, String, :tag => 'message'
end