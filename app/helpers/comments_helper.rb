module CommentsHelper
  # TODO:
  #   -There might be a way to put this in comments_helpers and access it from anywhere? (DONE?)
  #   -Unify scoring array maybe? This scoring is also declared in views/comments/_form.html.erb
  def literal_rating ( rating )
    scoring = {
      5 => 'Excellent',
      4 => 'Very Good',
      3 => 'Good',
      2 => 'Fair',
      1 => 'Bad'
    }

    scoring[ rating.floor ]
  end

  # TODO: There might be a way to put this in comments_helpers and access it from here? (DONE?)
  def average_rating( classis )
    @classis = Classis.find( classis.id )
    average_rating = @classis.comments.average( :rating )
  end
end
