class Category < ActiveRecord::Base
  has_many :children, class_name: "Category"
  belongs_to :parent, class_name: "Category",foreign_key: "top_id"

  validates :name,
            presence: {message: "Kategori Başlığı Boş Bırakılamaz!"}
  validates :slug,
            presence: {message: "Kategori Adresi Boş Bırakılamaz!"}
end