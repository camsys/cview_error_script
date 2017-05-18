require 'happymapper'
class CviewProcessingMessages
  include HappyMapper

  tag 'processingMessages'
    has_many :msg, String, :tag => 'msg'
end