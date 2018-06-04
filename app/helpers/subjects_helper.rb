module SubjectsHelper
  def teachers_count( subject )
    # TODO: Try not to use raw fragments of SQL queries?
    count = Classis
      .where( "subject_id = ?", subject.id )
      .joins( :professor )
      .count
  end
end