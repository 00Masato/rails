module ActionMailroom
  class DeliverInboundEmailToMailroomJob < ActiveJob::Base
    queue_as :rails_action_mailroom_inbound_email

    def perform(inbound_email)
      # ActionMailroom::Router.receive inbound_email
    end
  end
end
