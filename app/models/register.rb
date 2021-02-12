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
end
