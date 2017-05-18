require_relative '../../app/models/ifta_error.rb'
require_relative '../../app/models/irp_error.rb'

class XmlFileReaderManager

  def self.read_ifta_error_xml dir
    ifta_errors = []

    Dir.glob("*.xml") do |xml_file|
      if(xml_file.include?('IFTA') && !xml_file.include?('Success') )

        ita_error_xml = File.read(xml_file)

        ifta_error = IftaError.new
        ifta_error.transaction_summary = CviewTransactionSummary.parse(ita_error_xml, :single => true)
        ifta_error.error_warning_statistics = CviewErrorWarningStatistics.parse(ita_error_xml, :single => true)
        ifta_error.processingMessages = CviewProcessingMessages.parse(ita_error_xml, :single => true)
        ifta_error.business_rule_warnings = IftaBusinessRuleWarning.parse(ita_error_xml)
        ifta_error.business_rule_warnings_keys = IftaBusinessRuleWarningKeys.parse(ita_error_xml)
        ifta_error.business_rule_violations = IftaBusinessRuleViolation.parse(ita_error_xml)
        ifta_error.business_rule_violations_keys = IftaBusinessRuleViolationKeys.parse(ita_error_xml)

        ifta_error.date_received = determine_date_received_from_file_name(xml_file)

        ifta_errors << ifta_error
      end
    end

    ifta_errors
  end

  def self.read_irp_error_xml dir
    irp_errors = []


    Dir.glob("*.xml") do |xml_file|
    if( xml_file.include?('IRP') && !xml_file.include?('Success') )
        irp_error_xml = File.read(xml_file)

        irp_error = IrpError.new
        irp_error.transaction_summary = CviewTransactionSummary.parse(irp_error_xml, :single => true)
        irp_error.error_warning_statistics = CviewErrorWarningStatistics.parse(irp_error_xml, :single => true)
        irp_error.processingMessages = CviewProcessingMessages.parse(irp_error_xml, :single => true)
        irp_error.business_rule_warnings = IrpBusinessRuleWarning.parse(irp_error_xml)
        irp_error.business_rule_warnings_keys = IrpBusinessRuleWarningKeys.parse(irp_error_xml)
        irp_error.business_rule_violations = IrpBusinessRuleViolation.parse(irp_error_xml)
        irp_error.business_rule_violations_keys = IrpBusinessRuleViolationKeys.parse(irp_error_xml)

        irp_error.date_received = determine_date_received_from_file_name(xml_file)

        irp_errors << irp_error
      end

    end

    irp_errors
  end

  def self.determine_date_received_from_file_name(file_name)
    name = file_name.to_s

    date_time = DateTime.parse(name.split('_').last[0, 8])

    date_time.strftime("%m/%d/%Y")
  end

end