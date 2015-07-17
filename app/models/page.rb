class Page < ActiveRecord::Base

  validates :title, presence: {message: "Başlık Alanı Boş Bırakılamaz!"}
  validates :location, presence: {message: "Konum Alanı Boş Bırakılamaz!"}
  validates :page_title, presence: {message: "Sayfa Başlığı Alanı Boş Bırakılamaz!"}
  validates :content, presence: {message: "İçerik Alanı Boş Bırakılamaz!"},
            length: { minimum: 6, message:"İçerik Alanı 5 Karakterden Fazla Olmalıdır" }

  def location_attribute
    case self.location
      when "menu"
        "Menü"
      when "footer"
        "Footer"
      else
        "Konum Seçilmemeiş"
    end
  end



end
