module Topics
  class TopicCreatedNotificationJob < ApplicationJob
    queue_as :default

    def perform(actor_id, topic_id)
      topic = Topic.find_by(id: topic_id)
      actor = User.find_by(id: actor_id)

      return if topic.blank? || actor.blank?

      topic.users.where.not(id: actor_id).each do |recipient|
        I18n.with_locale(recipient.locale) do
          Notification.create!(
            actor_id: actor_id,
            notifiable: topic,
            event: Notification.events[:topic_created],
            recipient: recipient,
            message:
              I18n.t(
                'jobs.topics.topic_created_notification_job.topic_created',
                user_name: actor.name,
                community_name: topic.community.name,

              )
          )
        end
      end
    end
  end
end