module ProfessorsHelper
  def subjects_count( professor )
    # TODO: Try not to use raw fragments of SQL queries?
    count = Classis
      .where( "professor_id = ?", professor.id )
      .joins( :subject )
      .count
  end
end
