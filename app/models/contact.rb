class Contact < ActiveRecord::Base
    #CONTACT FORM VALIDATIONS
    validates :name, presence: true
    validates :email, presence: true
    validates :comments, presence: true
end