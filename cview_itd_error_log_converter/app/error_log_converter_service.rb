require 'rubygems'
require_relative "../../cview_itd_error_log_converter/app/managers/xml_file_reader_manager"
require_relative '../../cview_itd_error_log_converter/app/managers/csv_file_creation_manager'


class ErrorLogConverterService

    directory_to_read_and_write_to = '~/test'

    iftaErrors = XmlFileReaderManager.read_ifta_error_xml(directory_to_read_and_write_to)
    irpErrors = XmlFileReaderManager.read_irp_error_xml(directory_to_read_and_write_to)

    CsvFileCreationManager.writeCsvFor(directory_to_read_and_write_to, iftaErrors, irpErrors)

end