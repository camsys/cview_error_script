require 'happymapper'
class CviewTransactionSummary
  include HappyMapper
  tag 'transactionSummary'
    element :transaction_type, String, :tag => 'transactionType'
    element :transaction_version, String, :tag => 'transactionVersion'
    element :outcome, String, :tag => 'outcome'
    element :input_file, String, :tag => 'inputFile'

end