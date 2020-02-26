# class SpacePolicy < ApplicationPolicy
#   class Scope < Scope
#     def resolve
#       scope.all
#     end
#   end

#   def show?
#      true
#    end

#    def new?
#      show?
#    end

#    def create?
#      show?
#    end

#    def edit?
#      record.user == user || user.admin
#    end

#    def update?
#      edit?
#    end

#    def destroy?
#      edit?
#    end
# end
