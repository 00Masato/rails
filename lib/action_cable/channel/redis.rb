module ActionCable
  module Channel

    module Redis
      extend ActiveSupport::Concern

      included do
        on_unsubscribe :unsubscribe_from_redis_channels
        delegate :pubsub, to: :connection
      end

      def subscribe_to(redis_channel, callback = nil)
        callback ||= default_subscription_callback(redis_channel)
        @_redis_channels ||= []
        @_redis_channels << [ redis_channel, callback ]

        logger.info "Subscribing to the redis channel: #{redis_channel}"
        pubsub.subscribe(redis_channel, &callback)
      end

      protected
        def unsubscribe_from_redis_channels
          if @_redis_channels
            @_redis_channels.each do |channel, callback|
              logger.info "Unsubscribing from the redis channel: #{channel}"
              pubsub.unsubscribe_proc(channel, callback)
            end
          end
        end

        def default_subscription_callback(channel)
          -> (message) do
            logger.info "Received a message over the redis channel: #{channel}"
            broadcast ActiveSupport::JSON.decode(message)
          end
        end

    end

  end
end