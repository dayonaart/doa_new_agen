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
