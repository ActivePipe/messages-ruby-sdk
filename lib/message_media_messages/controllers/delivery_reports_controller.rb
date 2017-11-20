# This file was automatically generated for MessageMedia by APIMATIC v2.0
# ( https://apimatic.io ).

module MessageMediaMessages
  # DeliveryReportsController
  class DeliveryReportsController < BaseController
    @instance = DeliveryReportsController.new

    class << self
      attr_accessor :instance
    end

    def instance
      self.class.instance
    end

    # Check for any delivery reports that have been received.
    # Delivery reports are a notification of the change in status of a message
    # as it is being processed.
    # Each request to the check delivery reports endpoint will return any
    # delivery reports received that
    # have not yet been confirmed using the confirm delivery reports endpoint. A
    # response from the check
    # delivery reports endpoint will have the following structure:
    # ```json
    # {
    #     "delivery_reports": [
    #         {
    #             "callback_url": "https://my.callback.url.com",
    #             "delivery_report_id": "01e1fa0a-6e27-4945-9cdb-18644b4de043",
    #             "source_number": "+61491570157",
    #             "date_received": "2017-05-20T06:30:37.642Z",
    #             "status": "enroute",
    #             "delay": 0,
    #             "submitted_date": "2017-05-20T06:30:37.639Z",
    #             "original_text": "My first message!",
    #             "message_id": "d781dcab-d9d8-4fb2-9e03-872f07ae94ba",
    #             "vendor_account_id": {
    #                 "vendor_id": "MessageMedia",
    #                 "account_id": "MyAccount"
    #             },
    #             "metadata": {
    #                 "key1": "value1",
    #                 "key2": "value2"
    #             }
    #         },
    #         {
    #             "callback_url": "https://my.callback.url.com",
    #             "delivery_report_id": "0edf9022-7ccc-43e6-acab-480e93e98c1b",
    #             "source_number": "+61491570158",
    #             "date_received": "2017-05-21T01:46:42.579Z",
    #             "status": "enroute",
    #             "delay": 0,
    #             "submitted_date": "2017-05-21T01:46:42.574Z",
    #             "original_text": "My second message!",
    #             "message_id": "fbb3b3f5-b702-4d8b-ab44-65b2ee39a281",
    #             "vendor_account_id": {
    #                 "vendor_id": "MessageMedia",
    #                 "account_id": "MyAccount"
    #             },
    #             "metadata": {
    #                 "key1": "value1",
    #                 "key2": "value2"
    #             }
    #         }
    #     ]
    # }
    # ```
    # Each delivery report will contain details about the message, including any
    # metadata specified
    # and the new status of the message (as each delivery report indicates a
    # change in status of a
    # message) and the timestamp at which the status changed. Every delivery
    # report will have a
    # unique delivery report ID for use with the confirm delivery reports
    # endpoint.
    # *Note: The source number and destination number properties in a delivery
    # report are the inverse of
    # those specified in the message that the delivery report relates to. The
    # source number of the
    # delivery report is the destination number of the original message.*
    # Subsequent requests to the check delivery reports endpoint will return the
    # same delivery reports
    # and a maximum of 100 delivery reports will be returned in each request.
    # Applications should use the
    # confirm delivery reports endpoint in the following pattern so that
    # delivery reports that have been
    # processed are no longer returned in subsequent check delivery reports
    # requests.
    # 1. Call check delivery reports endpoint
    # 2. Process each delivery report
    # 3. Confirm all processed delivery reports using the confirm delivery
    # reports endpoint
    # *Note: It is recommended to use the Webhooks feature to receive reply
    # messages rather than
    # polling the check delivery reports endpoint.*
    # @return CheckDeliveryReportsResponse response from the API call
    def get_check_delivery_reports
      begin
        @logger.info("get_check_delivery_reports called.")
        # Prepare query url.
        @logger.info("Preparing query URL for get_check_delivery_reports.")
        _query_builder = Configuration.base_uri.dup
        _query_builder << '/v1/delivery_reports'
        _query_url = APIHelper.clean_url _query_builder
  
        # Prepare headers.
        @logger.info("Preparing headers for get_check_delivery_reports.")
        _headers = {
          'accept' => 'application/json'
        }
  
        # Prepare and execute HttpRequest.
        @logger.info('Preparing and executing HttpRequest for get_check_delivery_reports.')
        _request = @http_client.get(
          _query_url,
          headers: _headers
        )
        BasicAuth.apply(_request)
        _context = execute_request(_request, name: 'get_check_delivery_reports')
        validate_response(_context)
  
        # Return appropriate response type.
        @logger.info("Returning response for get_check_delivery_reports.")
        decoded = APIHelper.json_deserialize(_context.response.raw_body)
        CheckDeliveryReportsResponse.from_hash(decoded)

      rescue Exception => e
        @logger.error(e)
        raise e
      end
    end

    # Mark a delivery report as confirmed so it is no longer return in check
    # delivery reports requests.
    # The confirm delivery reports endpoint is intended to be used in
    # conjunction with the check delivery
    # reports endpoint to allow for robust processing of delivery reports. Once
    # one or more delivery
    # reports have been processed, they can then be confirmed using the confirm
    # delivery reports endpoint so they
    # are no longer returned in subsequent check delivery reports requests.
    # The confirm delivery reports endpoint takes a list of delivery report IDs
    # as follows:
    # ```json
    # {
    #     "delivery_report_ids": [
    #         "011dcead-6988-4ad6-a1c7-6b6c68ea628d",
    #         "3487b3fa-6586-4979-a233-2d1b095c7718",
    #         "ba28e94b-c83d-4759-98e7-ff9c7edb87a1"
    #     ]
    # }
    # ```
    # Up to 100 delivery reports can be confirmed in a single confirm delivery
    # reports request.
    # @param [ConfirmDeliveryReportsAsReceivedRequest] body Required parameter:
    # Example:
    # @return Mixed response from the API call
    def create_confirm_delivery_reports_as_received(body)
      begin
        @logger.info("create_confirm_delivery_reports_as_received called.")
        # Prepare query url.
        @logger.info("Preparing query URL for create_confirm_delivery_reports_as_received.")
        _query_builder = Configuration.base_uri.dup
        _query_builder << '/v1/delivery_reports/confirmed'
        _query_url = APIHelper.clean_url _query_builder
  
        # Prepare headers.
        @logger.info("Preparing headers for create_confirm_delivery_reports_as_received.")
        _headers = {
          'accept' => 'application/json',
          'content-type' => 'application/json; charset=utf-8'
        }
  
        # Prepare and execute HttpRequest.
        @logger.info('Preparing and executing HttpRequest for create_confirm_delivery_reports_as_received.')
        _request = @http_client.post(
          _query_url,
          headers: _headers,
          parameters: body.to_json
        )
        BasicAuth.apply(_request)
        _context = execute_request(_request, name: 'create_confirm_delivery_reports_as_received')
  
        # Validate response against endpoint and global error codes.
        @logger.info("Validating response for create_confirm_delivery_reports_as_received.")
        if _context.response.status_code == 400
          raise APIException.new(
            '',
            _context
          )
        end
        validate_response(_context)
  
        # Return appropriate response type.
        @logger.info("Returning response for create_confirm_delivery_reports_as_received.")
        decoded = APIHelper.json_deserialize(_context.response.raw_body) unless
          _context.response.raw_body.nil? ||
          _context.response.raw_body.to_s.strip.empty?
        decoded

      rescue Exception => e
        @logger.error(e)
        raise e
      end
    end
  end
end
