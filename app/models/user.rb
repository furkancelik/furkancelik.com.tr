class User < ActiveRecord::Base


  has_secure_password


  validates :username,
      presence: {message: "Kullanıcı Adı Alanı Boş Bırakılamaz!"},
      uniqueness: { case_sensitive: false, message: "Bu Kullanıcı Adı Daha Önce Kullanılmış!" },
      length: { in: 4..12,message: "Kullanıcı Adı 4 ile 12 Karakter Arasında Olmalıdır!" },
      format: { with: /\A[a-zA-Z][a-zA-Z0-9_-]*\Z/,message:"Kullanıcı Adı Geçersiz Karakter İçermemeli" }
  validates :first_name, presence: {message: "Adı Alanı Boş Bırakılamaz!"}
  validates :last_name, presence: {message: "Soyadı Alanı Boş Bırakılamaz!"}
  validates :email,
      presence: {message: "E-Posta Adresi Alanı Boş Bırakılamaz!"},
      uniqueness: { case_sensitive: false,message: "Bu E-Posta Adresi Daha Önceden Kullanılmış!" },
      email: {message: "Geçerli bir E-Posta Adresi Girmelisiniz!"}

  validates :password,
      presence: {message: "Şifre Alanı Boş Bırakılamaz" },
      length: { minimum: 6, message:"Şifre En Az 6 Karakter Olmalıdır" },
      on: :create
end
