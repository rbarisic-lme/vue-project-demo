class StaticPage < ApplicationRecord
  rails_admin do
    configure :body do
      label 'Body (Markdown): '
    end
  end
end
