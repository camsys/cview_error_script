require 'happymapper'
class CviewErrorWarningStatistics
  include HappyMapper
  tag 'statistics'
    element :number_received, String, :tag => 'numberReceived'
    element :number_applied, String, :tag => 'numberApplied'
end