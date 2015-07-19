class Article < ActiveRecord::Base
  has_and_belongs_to_many :category, dependent: :destroy

  validates :title,
            presence: {message: "Başlık Alanı Boş Bırakılamaz!"}
  validates :category,
            presence: {message: "Kategori Alanı Boş Bırakılamaz!"}
  validates :main_content,
            presence: {message: "Ana İçerik Alanı Boş Bırakılamaz!"}

end
