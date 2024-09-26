void main() {
  var tanggal = 21;  
  var bulan = 8;    
  var tahun = 1945;  

  String namaBulan;

  switch (bulan) {
    case 1:
      namaBulan = "Januari";
      break;
    case 2:
      namaBulan = "Februari";
      break;
    case 3:
      namaBulan = "Maret";
      break;
    case 4:
      namaBulan = "April";
      break;
    case 5:
      namaBulan = "Mei";
      break;
    case 6:
      namaBulan = "Juni";
      break;
    case 7:
      namaBulan = "Juli";
      break;
    case 8:
      namaBulan = "Agustus";
      break;
    case 9:
      namaBulan = "September";
      break;
    case 10:
      namaBulan = "Oktober";
      break;
    case 11:
      namaBulan = "November";
      break;
    case 12:
      namaBulan = "Desember";
      break;
    default:
      namaBulan = "Bulan tidak valid";
  }

  if (tanggal >= 1 && tanggal <= 31 && tahun >= 1900 && tahun <= 2200) {
    print('$tanggal $namaBulan $tahun');
  } else {
    print('Tanggal atau tahun tidak valid.');
  }
}
