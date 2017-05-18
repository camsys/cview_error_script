require 'happymapper'
class IrpBusinessRuleWarningKeys
  include HappyMapper

  tag 'business_rule_warnings'
  tag 'warning'
  tag 'keys'
    element :vin, String, :tag => 'vin'
    element :irp_base_state, String, :tag => 'irp_base_state'
    element :license_plate_number, String, :tag => 'license_plate_number'
    element :validated_data, String, :tag => 'validated_data'
end