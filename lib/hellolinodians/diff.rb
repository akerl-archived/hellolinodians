require 'set'
require 'indefinite_article'

##
# Diff constructs and message creation info
module HelloLinodians
  # rubocop:disable Metrics/LineLength
  MESSAGES = {
    addition: [
      'Congrats to %{fullname} on their new job as %{a_title} at @linode, CC @%{twitter}',
      'Congrats to %{fullname} on their new job as %{a_title} at @linode',
      'Congrats to %{fullname} on their new job at @linode, CC @%{twitter}',
      'Congrats to %{fullname} on their new job at @linode'
    ],
    removal: [
      'Best of luck to %{fullname} in their future endeavors! CC @%{twitter}',
      'Best of luck to %{fullname} in their future endeavors!'
    ],
    new_title: [
      'Congrats @linode! %{fullname} evolved into %{a_title}! CC @%{twitter}',
      'Congrats @linode! %{fullname} evolved into %{a_title}!'
    ]
  }
  # rubocop:enable Metrics/LineLength

  ##
  # Perform diffs on datasets
  class Diff
    def initialize(current, last)
      @current = current
      @last = last
    end

    def changes
      [:additions, :removals, :new_titles].map do |type|
        send(type).map { |x| [type, x] }
      end.flatten(1)
    end

    def additions
      (current_users - last_users).map do |user|
        generate_message MESSAGES[:addition], @current.lookup(user)
      end
    end

    def removals
      (last_users - current_users).map do |user|
        generate_message MESSAGES[:removal], @last.lookup(user)
      end
    end

    def new_titles
      (current_users & last_users).map do |user|
        next if @current.lookup(user).title == @last.lookup(user).title
        generate_message MESSAGES[:new_title], @current.lookup(user)
      end.compact
    end

    private

    def expand(message, data)
      message % data
    rescue KeyError
      nil
    end

    def generate_message(messages, user)
      data = user.to_h.merge a_title: user.title.with_indefinite_article
      parsed = messages.map do |message|
        expand message, data
      end
      parsed.compact.find { |x| x.size < 141 }
    end

    def current_users
      @current_users ||= @current.map(&:username).to_set
    end

    def last_users
      @last_user ||= @last.map(&:username).to_set
    end
  end
end
