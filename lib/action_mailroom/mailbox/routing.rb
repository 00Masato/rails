module ActionMailroom::Mailbox::Routing
  extend ActiveSupport::Concern

  class_methods do
    attr_reader :router

    def routing(routes)
      (@router ||= ActionMailroom::Router.new).add_routes(routes)
    end

    def route(inbound_email)
      @router.route(inbound_email)
    end
  end
end
