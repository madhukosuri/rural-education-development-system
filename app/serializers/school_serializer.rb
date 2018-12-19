class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :staffs_count
  has_many :school_staffs, serializer: SchoolStaffSerializer, root: :school_staffs
  has_many :events, serializer: EventSerializer, root: :events
  has_many :admissions, serializer: AdmissionSerializer, root: :admissions
  # attribute :conditional_attr, if: :condition?

  def staffs_count
  	object.events.count
  end
 
  # def condition?
  # end

end
