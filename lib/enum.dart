extension PersonNameValidator on String {
  bool isNotValidPersonName() {
    return RegExp(r'[{}+!@#$%^&*()?><,./\;@=_0-9-]').hasMatch(this);
  }
}

extension OnlyTextAndNumberValidator on String {
  bool isValidTextAndNumber() {
    return RegExp(r'[{}+!@#$%^&*()?><,./\;@=_-]').hasMatch(this);
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PhoneValidator on String {
  bool isValidPhone() {
    return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(this);
  }
}

extension NpwpValidator on String {
  bool isValidNpwp() {
    return RegExp(r'(^(?:[+0]9)?[0-9]{16}$)').hasMatch(this);
  }
}

enum OnBoardingWord {
  tungguApalagi,
  nikmatiKemudahanDenganBNIAgen46,
  melayaniPalingDekat,
  belumPunyaAkunBNIAgen46,
  daftarSekarang,
  masuk
}

extension OnBoardingText on OnBoardingWord {
  String get text {
    switch (this) {
      case OnBoardingWord.tungguApalagi:
        return "Tunggu Apalagi!";
      case OnBoardingWord.nikmatiKemudahanDenganBNIAgen46:
        return "Nikmati kemudahan dengan BNI Agen46";
      case OnBoardingWord.melayaniPalingDekat:
        return "#Melayani Paling Dekat";
      case OnBoardingWord.belumPunyaAkunBNIAgen46:
        return "Belum punya akun BNI Agen46 ?";
      case OnBoardingWord.daftarSekarang:
        return "\nDaftar Sekarang";
      case OnBoardingWord.masuk:
        return "Masuk";
      default:
        return "";
    }
  }
}

enum PreregisterWord {
  pendaftaranBNIAgen46,
  apakahAndaSudahMemilikiRekening,
  belumPunya,
  sudahPunya,
}

extension PreregisterText on PreregisterWord {
  String get text {
    switch (this) {
      case PreregisterWord.pendaftaranBNIAgen46:
        return "Pendaftaran BNI Agen46";
      case PreregisterWord.apakahAndaSudahMemilikiRekening:
        return "Apakah Anda sudah memiliki Rekening Taplus Bisnis BNI Agen46 ?";
      case PreregisterWord.belumPunya:
        return "Belum punya";
      case PreregisterWord.sudahPunya:
        return "Sudah punya";
      default:
        return "";
    }
  }
}

enum OpeningTncWord {
  syaratKetentuan,
  lanjut,
  sayaSetujuDengan,
  skRekeningTabungan,
  persetujuanPenawaranProduk,
}

extension OpeningTncText on OpeningTncWord {
  String get text {
    switch (this) {
      case OpeningTncWord.syaratKetentuan:
        return "Syarat & Ketentuan";
      case OpeningTncWord.lanjut:
        return "Lanjut";
      case OpeningTncWord.sayaSetujuDengan:
        return "Saya setuju dengan";
      case OpeningTncWord.skRekeningTabungan:
        return " “Syarat dan Ketentuan Rekening Tabungan Perorangan”";
      case OpeningTncWord.persetujuanPenawaranProduk:
        return " “Persetujuan Penawaran Produk dan Jasa Layanan”";
      default:
        return "";
    }
  }
}

enum AccountTypeWord {
  pilihRekening,
  fiturKartu,
  sayaSetujuDengan,
  keuntunganManfaat,
  jenisTabungan,
  taplusBisnisAgen46,
  memberikanKemudahan,
  selengkapnya,
  sembunyikan,
}

extension AccountTypeText on AccountTypeWord {
  String get text {
    switch (this) {
      case AccountTypeWord.pilihRekening:
        return "Pilih Rekening";
      case AccountTypeWord.fiturKartu:
        return "Fitur Kartu";
      case AccountTypeWord.keuntunganManfaat:
        return "Keuntungan & Manfaat";
      case AccountTypeWord.jenisTabungan:
        return "Jenis Tabungan";
      case AccountTypeWord.taplusBisnisAgen46:
        return "Taplus Bisnis Agen46";
      case AccountTypeWord.memberikanKemudahan:
        return "Memberikan kemudahan, kenyamanan layanan dan banyak keuntungan untuk berbagai aktifitas perbankan.";
      case AccountTypeWord.sembunyikan:
        return "Sembunyikan";
      case AccountTypeWord.selengkapnya:
        return "Selengkapnya";
      default:
        return "";
    }
  }
}

enum InputPhoneNumberWord {
  inputNomorHandphone,
  lanjut,
  kamiAkanMelakukanProses,
  nomorAndaMemilikiPulsa,
  jagaKerahasiaanOTP,
  denganTidakMemberitahu,
  nomorHandphone,
  indonesia62,
  posisiAndaSaatIni,
  indonesia,
  singapore,
  thailand,
  brunei,
  india,
  china,
  vietnam,
  uSA,
  negara,
  pilihNegara,
  selesai,
  pastikanNomorHandphoneDialog,
}

extension InputPhoneNumberText on InputPhoneNumberWord {
  String get text {
    switch (this) {
      case InputPhoneNumberWord.inputNomorHandphone:
        return "Input Nomor Handphone";
      case InputPhoneNumberWord.lanjut:
        return "Lanjut";
      case InputPhoneNumberWord.kamiAkanMelakukanProses:
        return "Kami akan melakukan proses verifikasi nomor HP setelah proses pembukaan rekening selesai diproses. Pastikan ";
      case InputPhoneNumberWord.nomorAndaMemilikiPulsa:
        return "nomor Anda memiliki pulsa dan terkoneksi dengan jaringan Internet.";
      case InputPhoneNumberWord.jagaKerahasiaanOTP:
        return "Jaga kerahasiaan OTP ";
      case InputPhoneNumberWord.denganTidakMemberitahu:
        return "dengan tidak memberitahu kepada siapapun termasuk kepada Petugas Bank.";
      case InputPhoneNumberWord.nomorHandphone:
        return "Nomor Handphone";
      case InputPhoneNumberWord.indonesia62:
        return "Indonesia (+62)";
      case InputPhoneNumberWord.posisiAndaSaatIni:
        return "Posisi Anda Saat Ini";
      case InputPhoneNumberWord.indonesia:
        return "Indonesia";
      case InputPhoneNumberWord.singapore:
        return "Singapore";
      case InputPhoneNumberWord.thailand:
        return "Tailand";
      case InputPhoneNumberWord.brunei:
        return "Brunei";
      case InputPhoneNumberWord.india:
        return "India";
      case InputPhoneNumberWord.china:
        return "China";
      case InputPhoneNumberWord.vietnam:
        return "Vietnam";
      case InputPhoneNumberWord.uSA:
        return "USA";
      case InputPhoneNumberWord.negara:
        return "Negara";
      case InputPhoneNumberWord.pilihNegara:
        return "Pilih Negara";
      case InputPhoneNumberWord.pastikanNomorHandphoneDialog:
        return "Pastikan nomor Handphone yang Anda masukan sesuai format\ncontoh : 8123456789";
      case InputPhoneNumberWord.selesai:
        return "Selesai";
      default:
        return "";
    }
  }
}

enum KtpRegistrationWord {
  registrasi,
  lanjut,
  verifikasieKTP,
  prosesIniBertujuan,
  pastikanHasilFoto,
  sesuaiDenganIdentitasAnda
}

extension KtpRegistrationText on KtpRegistrationWord {
  String get text {
    switch (this) {
      case KtpRegistrationWord.registrasi:
        return "Registrasi";
      case KtpRegistrationWord.lanjut:
        return "Lanjut";
      case KtpRegistrationWord.verifikasieKTP:
        return "Verifikasi e-KTP";
      case KtpRegistrationWord.prosesIniBertujuan:
        return "Proses ini bertujuan untuk mempermudah\nmelakukan pengisian dan validasi data Anda.";
      case KtpRegistrationWord.pastikanHasilFoto:
        return "Pastikan hasil foto memenuhi ketentuan dibawah:";
      case KtpRegistrationWord.sesuaiDenganIdentitasAnda:
        return "• * sesuai dengan identitas Anda\n• * tidak silau & tidak buram\n• * terbaca jelas dan tidak terpotong\n• Tidak ada objek lain selain KTP dalam foto";
      default:
        return "";
    }
  }
}

enum OpeningAccountWord {
  bukaRekening,
  ayoBukaTabungan,
  jikaAndaSudahMempunyai,
  untukKelancaranPembukaan,
  eKtpWajib,
  lanjut,
}

extension OpeningAccountText on OpeningAccountWord {
  String get text {
    switch (this) {
      case OpeningAccountWord.bukaRekening:
        return "Buka Rekening";
      case OpeningAccountWord.ayoBukaTabungan:
        return "Ayo buka tabungan digital bisnis BNI Agen46 sekarang juga!";
      case OpeningAccountWord.jikaAndaSudahMempunyai:
        return "Jika Anda sudah mempunyai rekening tabungan bisnis BNI Agen46 , silakan lakukan pendaftaran pada\nhalaman sebelumnya dan pilih “Sudah Punya";
      case OpeningAccountWord.untukKelancaranPembukaan:
        return "Untuk kelancaran pembukaan tabungan, siapkan\ndahulu:";
      case OpeningAccountWord.eKtpWajib:
        return "• e-KTP (wajib) & NPWP (bila ada)\n• Pulsa / paket data untuk pengiriman OTP\n• Kertas & alat tulis untuk foto tanda tangan";
      case OpeningAccountWord.lanjut:
        return "Lanjut";
      default:
        return "";
    }
  }
}

enum TakeCameraKtpWord {
  registrasi,
  pastikanPosisi,
  ktpAsli,
  pastikanFoto,
  sudahSesuai,
  fotoSudahSesuai,
  fotoUlang
}

extension TakeCameraKtpText on TakeCameraKtpWord {
  String get text {
    switch (this) {
      case TakeCameraKtpWord.registrasi:
        return "Registrasi";
      case TakeCameraKtpWord.pastikanPosisi:
        return "Pastikan posisi & dan klik ambil foto. Pastikan foto terlihat dengan jelas.";
      case TakeCameraKtpWord.ktpAsli:
        return "KTP asli pada area yang tersedia";
      case TakeCameraKtpWord.pastikanFoto:
        return "Pastikan foto yang anda ambil ";
      case TakeCameraKtpWord.sudahSesuai:
        return "sudah sesuai dan sudah fokus (tidak blur).";
      case TakeCameraKtpWord.fotoSudahSesuai:
        return "Foto sudah sesuai";
      case TakeCameraKtpWord.fotoUlang:
        return "Foto Ulang";
      default:
        return "";
    }
  }
}

enum AccountCardName {
  kartuDebitBNIAgen46GPNCombo1,
  kartuDebitBNIAgen46GPNCombo2,
  kartuDebitBNIAgen46GPNCombo3
}

extension AccountCardNameTitle on AccountCardName {
  String get title {
    switch (this) {
      case AccountCardName.kartuDebitBNIAgen46GPNCombo1:
        return "Kartu Debit BNI Agen46 GPN Combo";
      case AccountCardName.kartuDebitBNIAgen46GPNCombo2:
        return "Kartu Debit BNI Agen46 GPN Combo 2";
      case AccountCardName.kartuDebitBNIAgen46GPNCombo3:
        return "Kartu Debit BNI Agen46 GPN Combo 3";
      default:
        return "";
    }
  }
}

enum FeatureTitleList {
  setoranAwal,
  totalTarikTunai,
  limitTransaksiBelanja,
  transferAntarRekeningBNIviaATM,
  transferAntarBankviaATM,
}

extension FeatureTitle on FeatureTitleList {
  String get title {
    switch (this) {
      case FeatureTitleList.setoranAwal:
        return 'Setoran Awal';
      case FeatureTitleList.totalTarikTunai:
        return 'Total Tarik Tunai';
      case FeatureTitleList.limitTransaksiBelanja:
        return 'Limit Transaksi Belanja';
      case FeatureTitleList.transferAntarRekeningBNIviaATM:
        return 'Transfer Antar Rekening BNI via ATM';
      case FeatureTitleList.transferAntarBankviaATM:
        return 'Transfer Antar Bank via ATM';
      default:
        return '';
    }
  }

  String get value1 {
    switch (this) {
      case FeatureTitleList.setoranAwal:
        return 'Rp150.000';
      case FeatureTitleList.totalTarikTunai:
        return 'Rp15 juta / hari';
      case FeatureTitleList.limitTransaksiBelanja:
        return 'Rp50 juta / hari';
      case FeatureTitleList.transferAntarRekeningBNIviaATM:
        return 'Rp100 juta / hari';
      case FeatureTitleList.transferAntarBankviaATM:
        return 'Rp25 juta / hari';
      default:
        return '';
    }
  }

  String get value2 {
    switch (this) {
      case FeatureTitleList.setoranAwal:
        return 'Rp160.000';
      case FeatureTitleList.totalTarikTunai:
        return 'Rp16 juta / hari';
      case FeatureTitleList.limitTransaksiBelanja:
        return 'Rp60 juta / hari';
      case FeatureTitleList.transferAntarRekeningBNIviaATM:
        return 'Rp150 juta / hari';
      case FeatureTitleList.transferAntarBankviaATM:
        return 'Rp35 juta / hari';
      default:
        return '';
    }
  }

  String get value3 {
    switch (this) {
      case FeatureTitleList.setoranAwal:
        return 'Rp190.000';
      case FeatureTitleList.totalTarikTunai:
        return 'Rp19 juta / hari';
      case FeatureTitleList.limitTransaksiBelanja:
        return 'Rp90 juta / hari';
      case FeatureTitleList.transferAntarRekeningBNIviaATM:
        return 'Rp190 juta / hari';
      case FeatureTitleList.transferAntarBankviaATM:
        return 'Rp45 juta / hari';
      default:
        return '';
    }
  }
}

enum FeatureExpandListDesc { desc1, desc2, desc3 }

extension FeatureExpandDesc on FeatureExpandListDesc {
  String get desc {
    switch (this) {
      case FeatureExpandListDesc.desc1:
        return "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
      case FeatureExpandListDesc.desc2:
        return "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
      case FeatureExpandListDesc.desc3:
        return "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of section 1.10.32.";
      default:
        return "";
    }
  }
}

enum RegistrationFormPrivateLabel {
  namaLengkap,
  tempatLahir,
  tanggalLahir,
  jenisKelamin,
  alamat,
  rt,
  rw,
  provonsi,
  kotaKabupaten,
  kecamatan,
  desaKelurahan,
  agama,
  kodePos,
  kotaPenerbitIndentitas,
  email,
  nomorTelepon,
  nomorTeleponRumah,
  nomorNpwp,
  statusPerkawinan,
  namaIbuKandung,
}

extension FormPrivateTitle on RegistrationFormPrivateLabel {
  String get title {
    switch (this) {
      case RegistrationFormPrivateLabel.namaLengkap:
        return "Nama Lengkap";
      case RegistrationFormPrivateLabel.tempatLahir:
        return "Tempat Lahir";
      case RegistrationFormPrivateLabel.tanggalLahir:
        return "Tanggal Lahir";
      case RegistrationFormPrivateLabel.jenisKelamin:
        return "Jenis Kelamin";
      case RegistrationFormPrivateLabel.alamat:
        return "Alamat";
      case RegistrationFormPrivateLabel.rt:
        return "RT";
      case RegistrationFormPrivateLabel.rw:
        return "RW";
      case RegistrationFormPrivateLabel.provonsi:
        return "Provinsi";
      case RegistrationFormPrivateLabel.kotaKabupaten:
        return "Kota / Kabupaten";
      case RegistrationFormPrivateLabel.kecamatan:
        return "Kecamatan";
      case RegistrationFormPrivateLabel.desaKelurahan:
        return "Desa / Kelurahan";
      case RegistrationFormPrivateLabel.agama:
        return "Agama";
      case RegistrationFormPrivateLabel.kodePos:
        return "Kode Pos";
      case RegistrationFormPrivateLabel.kotaPenerbitIndentitas:
        return "Kota Penerbit Identitas";
      case RegistrationFormPrivateLabel.email:
        return "Email";
      case RegistrationFormPrivateLabel.nomorTelepon:
        return "Nomor Telepon";
      case RegistrationFormPrivateLabel.nomorTeleponRumah:
        return "Nomor Telepon Rumah";
      case RegistrationFormPrivateLabel.nomorNpwp:
        return "Nomor NPWP";
      case RegistrationFormPrivateLabel.statusPerkawinan:
        return "Status Perkawinan";
      case RegistrationFormPrivateLabel.namaIbuKandung:
        return "Nama Ibu Kandung";
      default:
        return "";
    }
  }
}

enum RegistrationFormJobDetailLabel {
  pekerjaan,
  penghasilanPerbulan,
  sumberDana,
  perkiraanNilaiTransaksi,
  tujuanPembukaanRekening,
  jabatan,
  namaTempatKerjaPerusahaan,
  noTeleponTempatBekerja,
  alamatTempatKerja,
  kodePos,
}

extension FormJobTitle on RegistrationFormJobDetailLabel {
  String get title {
    switch (this) {
      case RegistrationFormJobDetailLabel.pekerjaan:
        return "Pekerjaan";
      case RegistrationFormJobDetailLabel.penghasilanPerbulan:
        return "Penghasilan Perbulan";
      case RegistrationFormJobDetailLabel.sumberDana:
        return "Sumber Dana";
      case RegistrationFormJobDetailLabel.perkiraanNilaiTransaksi:
        return "Perkiraan Nilai Transaksi";
      case RegistrationFormJobDetailLabel.tujuanPembukaanRekening:
        return "Tujuan Pembukaan Rekening";
      case RegistrationFormJobDetailLabel.jabatan:
        return "Jabatan";
      case RegistrationFormJobDetailLabel.namaTempatKerjaPerusahaan:
        return "Nama Tempat Kerja Perusahaan";
      case RegistrationFormJobDetailLabel.noTeleponTempatBekerja:
        return "No.Telepon Tempat Bekerja";
      case RegistrationFormJobDetailLabel.alamatTempatKerja:
        return "Alamat Tempat Kerja";
      case RegistrationFormJobDetailLabel.kodePos:
        return "Kode Pos";
      default:
        return "";
    }
  }
}
