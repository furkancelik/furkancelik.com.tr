class Category < ActiveRecord::Base
  has_many :children, class_name: "Category" ,dependent: :destroy , foreign_key: "top_id"
  belongs_to :parent, class_name: "Category",foreign_key: "top_id"
  has_and_belongs_to_many :articles, dependent: :destroy

  validates :name,
            presence: {message: "Kategori Başlığı Boş Bırakılamaz!"}
  validates :slug,
            presence: {message: "Kategori Adresi Boş Bırakılamaz!"}
end