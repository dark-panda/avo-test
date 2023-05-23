# frozen_string_literal: true

class UserResource < Avo::BaseResource
  self.title = :name
  self.description = -> {
    "Users of the app. view: #{view}"
  }
  self.translation_key = "avo.resource_translations.user"

  field :id, as: :id, link_to_resource: true, sortable: false
  field :email, as: :gravatar, link_to_resource: true, as_avatar: :circle, only_on: :index
end
