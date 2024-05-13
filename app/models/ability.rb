# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, namespace)
    case namespace
    when 'Admin'
      return unless user.manager? || user.admin?

      can :read, Book
      can :manage, Category
      return unless user.admin?

      can :manage, :all
    end
    can :read, Book
    return unless user.present?

    can :read, Book, status: :published
  end
end
