module StaticPagesHelper

  def all_people
    @people = User.all.collect { |a| [a.name, a.id] }
  end
end
