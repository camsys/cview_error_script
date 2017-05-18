require 'happymapper'
class IftaBusinessRuleWarningKeys
  include HappyMapper
  tag 'business_rule_warnings'
    tag 'warning'
      tag 'keys'
      element :ifta_license_number, String, :tag => 'ifta_license_number'
      element :ifta_base_country, String, :tag => 'ifta_base_country'
      element :ifta_base_state, String, :tag => 'ifta_base_state'
      element :validated_data, String, :tag => 'validated_data'
end