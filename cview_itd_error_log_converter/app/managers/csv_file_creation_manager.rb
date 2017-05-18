require "csv"
require_relative '../../app/models/ifta_error.rb'
require_relative '../../app/models/irp_error.rb'

class CsvFileCreationManager

  def self.writeCsvFor(dir, iftaErrors, irpErrors)
    iftaErrors.sort_by(&:date_received)
    irpErrors.sort_by(&:date_received)

    first_date = find_first_date(iftaErrors, irpErrors)
    last_date = find_last_date(iftaErrors, irpErrors)

    CSV.open("SAFER_Error_Logs_#{first_date.strftime("%m_%d_%Y")}_#{last_date.strftime("%m_%d_%Y")}.csv", "wb") do |csv|

      csv << ['Date of Error/Warning', 'IRP or IFTA', 'Warning or Error', 'Message', 'VIN', 'License Plate', 'IRP Account #', 'Validated Data', 'Follow-up']

      iftaErrors.each  { |iftaError|
        vioation_counter = 0
        while vioation_counter < iftaError.business_rule_violations.count do
          key = iftaError.business_rule_violations_keys[vioation_counter]
          csv << [iftaError.date_received, 'IFTA', 'Error', iftaError.business_rule_violations[vioation_counter].message, key.ifta_license_number, 'NA', 'NA', key.validated_data]
          vioation_counter += 1
        end

        warning_counter = 0
        while warning_counter < iftaError.business_rule_warnings.count do
          key = iftaError.business_rule_warnings_keys[warning_counter+vioation_counter]
          csv << [iftaError.date_received, 'IFTA', 'Warning', iftaError.business_rule_warnings[warning_counter].message, key.ifta_license_number, 'NA', 'NA', key.validated_data]
          warning_counter += 1
        end

      }
      irpErrors.each  { |irpError|
        vioation_counter = 0
        while vioation_counter < irpError.business_rule_violations.count do
          key = irpError.business_rule_violations_keys[vioation_counter]
          csv << [irpError.date_received, 'IRP', 'Error', irpError.business_rule_violations[vioation_counter].message, key.vin, key.license_plate_number, key.irp_base_state, key.validated_data]
          vioation_counter += 1
        end

        warning_counter = 0
        while warning_counter < irpError.business_rule_warnings.count do
          key = irpError.business_rule_warnings_keys[warning_counter+vioation_counter]
          csv << [irpError.date_received, 'IRP', 'Warning', irpError.business_rule_warnings[warning_counter].message, key.vin, key.license_plate_number, key.irp_base_state, key.validated_data]
          warning_counter += 1
        end

      }
    end
  end

  def self.find_last_date(iftaErrors, irpErrors)
    date = DateTime.now
    if iftaErrors.count > 0 && irpErrors.count == 0
      date = irpErrors.last.date_received
    elsif iftaErrors.count == 0 && irpErrors.count > 0
      date = irpErrors.last.date_received
    elsif iftaErrors.count > 0 && irpErrors.count > 0
      date = iftaErrors.last.date_received <= irpErrors.last.date_received ? irpErrors.last.date_received : irpErrors.last.date_received
    end

    date
  end

  def self.find_first_date(iftaErrors, irpErrors)
    date = DateTime.now
    if iftaErrors.count > 0 && irpErrors.count == 0
      date = iftaErrors.first.date_received
    elsif iftaErrors.count == 0 && irpErrors.count > 0
      date = iftaErrors.first.date_received
    elsif iftaErrors.count > 0 && irpErrors.count > 0
      date = iftaErrors.first.date_received <= irpErrors.first.date_received ? irpErrors.first.date_received : irpErrors.first.date_received
    end

    date
  end

end