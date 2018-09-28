require "mail"

class ActionMailroom::InboundEmail < ActiveRecord::Base
  self.table_name = "action_mailroom_inbound_emails"

  include Incineratable, Routable

  has_one_attached :raw_email
  enum status: %i[ pending processing delivered failed bounced ]

  before_save :generate_missing_message_id

  class << self
    def create_from_raw_email!(raw_email, **options)
      create! raw_email: raw_email, message_id: extract_message_id(raw_email), **options
    end
    
    def mail_from_source(source)
      Mail.new(Mail::Utilities.binary_unsafe_to_crlf(source.to_s))
    end

    private
      def extract_message_id(raw_email)
        mail_from_source(raw_email.read).message_id
      rescue => e
        # FIXME: Add logging with "Couldn't extract Message ID, so will generating a new random ID instead"
      end
  end

  def mail
    @mail ||= self.class.mail_from_source(source)
  end

  def source
    @source ||= raw_email.download
  end

  private
    def generate_missing_message_id
      self.message_id ||= Mail::MessageIdField.new.message_id
    end
end
