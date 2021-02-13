class Register < ApplicationRecord

  ##### CONSTANTS
  ENTRADA =  { id: 1, name: "ENTRADA" }
  ALMOCO =  { id: 2, name: "ALMOÇO" }
  SAIDA =  { id: 3, name: "SAIDA" }
  KIND_OPTIONS = [ENTRADA, ALMOCO, SAIDA]

  ##### RELATIONSHIPS
  belongs_to :user

  ##### VALIDATIONS
  validates :user, presence: true
  validates :date, presence: true
  validates :kind, presence: true

  ##### HELPERS
  def self.get_human_kinds(kind)
    KIND_OPTIONS.each do |ki|
      if kind == ki[:id]
        return ki[:name]
      end
    end
    return I18n.t('helpers.application.unknow')
  end

  ##### SCOPES
  filterrific(
    available_filters: [
      :with_kind,
      :with_date
    ]
  )
  scope :with_kind, lambda { |kind|
    where(kind: kind, user_id: 2)
  }
  scope :with_date, lambda { |register_date|
    where(date: Time.parse(register_date).beginning_of_day..Time.parse(register_date).end_of_day)
  }
end
