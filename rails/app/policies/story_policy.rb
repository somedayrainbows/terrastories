class StoryPolicy
    class Scope
        attr_reader :user, :story
    
        def initialize(user, story)
          @user  = user
          @story = story
        end

        def resolve
            stories = Story.all
            stories.reject { |story| story.permission_level == 'editor' } unless user.editor?
            stories
        end
    end
    
    def update?
        user.editor?
    end
end
