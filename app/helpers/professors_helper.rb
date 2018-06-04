module ProfessorsHelper
  def subjects_count( professor )
    # TODO: Try not to use raw fragments of SQL queries?
    count = Classis
      .where( "professor_id = ?", professor.id )
      .joins( :subject )
      .count
  end

  # TODO: I'm starting to think *_helper.rb files are for views only. Look up in the future maybe
  # if what we're doing is wrong and amend it?
  def get_classes_by_professor( professor )
    # TODO: Try not to use raw fragments of SQL queries?
    @classes = Classis
      .select( 'subjects.title' )
      .where( "professor_id = ?", professor.id )
      .joins( :subject )
  end
end
