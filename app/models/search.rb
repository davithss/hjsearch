class Search < ApplicationRecord
  searchkick text_start: [:title]
end
