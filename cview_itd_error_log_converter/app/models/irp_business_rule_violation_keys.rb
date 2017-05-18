require 'happymapper'
class IrpBusinessRuleViolationKeys
  include HappyMapper
  tag 'business_rule_violations'
  tag 'error'
  tag 'keys'
  has_one :vin, String, :xpath => './vin'
  has_one :irp_base_state, String, :xpath => './irp_base_state'
  has_one :license_plate_number, String, :xpath => './license_plate_number'
  has_one :validated_data, String, :xpath => './validated_data'
end



