
import 'package:prayer_time_gi/Screens/MenuPages/Books/EbookListTile.dart';

class BookName{String tamElmihal = "Tam Elmihal Səadəti-Əbədiyyə";
String mektubat = "Mektubat";
String sevgili = "Sevgili Peyğəmbərim (Sallallahu Əleyhi və Səlləm)";
String namazKitabiAz = "Namaz Kitabı";
String namazKitabitr = "Namaz Kitabı";
String hayat = "Hz Muhammedin-in Hayatı";
String sevahidunNubuvve = "Şəvâhid-ün Nübüvvə";
String kiyametveaxiret = "Kiyamet ve Ahiret";
String menakib = "Menaqıb-ı Çihar Yar-i Güzin";
String qiymetsizyaz = "Qiymətsiz Yazılar";
String islamexlaqi = "İslam Əxlaqı";
String cennetYolu = "Cənnət Yolu Elmihalı";
String azerbaycanOv = "Azərbaycan övliyaları və mənkibələr";
String jiznPro = "Жизнь Пророка Мухаммеда";
String herkeseLazim = "Hərkəsə Lazım Olan İman";
String xanimlaraReh = "Xanımlara Rəhbər Bilgilər";
String islamExlaqi = "İslam Əxlaqı";
String islamAhlaki = "İslam Ahlakı";
String qiyametveax = "Qiyamət və Axirət";
String k365gun = "365 Gün Dua";
String molitvennik = "Молитвенник";
String religiya = "Религия Ислам";
String eyogul = "Ey Oğul Elmihalı";
String rehber = "Rəhbər Elmihalı";
String osinmoy = "О Сын Мой";
String seadetinmenbeyi = "Səadətin Mənbəyi - Ailə";
String Hocamiz = "Hüseyin Hilmi İşıq";
String HasanYavas = "Hasan Yavaş";
String MehmetOruc = "Mehmet Oruç";
String RamazanAyvalli = "Ramazan Ayvallı";
String MuhammedHadimi = "Məhəmməd Xadimi";
String iRQS = "İmamı Rabbani Quddise Sirruh";




////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////


}



class BookListDart with BookName{
  final String bookTitle;
  final String bookPngPath;
  final String bookLink;
  final String subtitle;

  BookListDart(this.bookTitle , this.subtitle , this.bookLink , this.bookPngPath , );


  static List<BookListDart> BookListView  = [
    BookListDart(BookName().namazKitabiAz, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2021-02/1613040685_namaz-yeni2020-144x214.pdf", "assets/namazkitabiaz.png"
          ),

    BookListDart(BookName().eyogul, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-09/1568294071_ey-oul-elmihal-son.pdf", "assets/eyogul.png"),
    BookListDart(BookName().molitvennik, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-09/1568380990_kniga-o-namaze.pdf", "assets/molitvennik.png"),
    BookListDart(BookName().azerbaycanOv, "", "https://www.gozelislam.com/uploads/files/2019-05/1559235919_kitab-2016.pdf", "assets/ovliyalar.jpg",),
    BookListDart(BookName().sevgili, BookName().RamazanAyvalli , "http://www.hakikatkitabevi.net/public/book.download.php?view=1&type=PDF&bookCode=238", "assets/1558894510_sevgili.jpg",),
    BookListDart(BookName().religiya, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-09/1568380799_islam.pdf", "assets/religiya.png"),
    BookListDart(BookName().rehber, BookName().HasanYavas , "https://www.gozelislam.com/uploads/files/2019-06/1560017598_rehberlmihali.pdf", "assets/rehberilmihal.jpg",),
    BookListDart(BookName().qiyametveax, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-05/qiyamet_ve_axiret.pdf", "assets/qvaaz.jpeg",),
    BookListDart(BookName().osinmoy, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-05/o_sin_moi.pdf", "assets/osinmoy.png"),
    BookListDart(BookName().cennetYolu, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-05/1559235651_c_elmihali.pdf", "assets/cyeaz.png"),
    BookListDart(BookName().hayat, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-06/1559920221_mybelovedprophet-tr.pdf", "assets/hayata.jpeg",),
    BookListDart(BookName().jiznPro, BookName().RamazanAyvalli , "https://www.gozelislam.com/uploads/files/2019-09/1568381377_mybelovedprophet-ru.pdf", "assets/jizpro.jpeg",),
    BookListDart(BookName().k365gun, BookName().MehmetOruc , "https://www.gozelislam.com/uploads/files/2019-06/1560018481_dua.pdf", "assets/365.jpg",),
    BookListDart(BookName().kiyametveaxiret, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-06/1559856949_06_kiyamet_ve_ahiret.pdf", "assets/ka.png"),
    BookListDart(BookName().mektubat, BookName().iRQS , "https://www.gozelislam.com/uploads/files/2019-06/1559852933_mektubat_tercemesi.pdf", "assets/mektubat.png"),
    BookListDart(BookName().menakib, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-06/1559856759_12_menakibi_cihar_yari_guzin.pdf", "assets/mcyg.png"),
    BookListDart(BookName().qiymetsizyaz, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-06/1559856031_09_kiymetsiz_yazilar.pdf", "assets/ky.png"),
    BookListDart(BookName().sevahidunNubuvve, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-06/1559857537_11_sevahidun_nubuvve.pdf", "assets/sn.png"),
    BookListDart(BookName().tamElmihal, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-06/1559852577_tam_ilmihal.pdf", "assets/elmihal.png"),
    BookListDart(BookName().islamAhlaki, BookName().Hocamiz , "https://www.gozelislam.com/uploads/files/2019-09/1568294041_04_islam_ahlaki.pdf", "assets/ia.png"),
    BookListDart(BookName().namazKitabitr, BookName().HasanYavas , "https://www.gozelislam.com/uploads/files/2019-09/1568294123_10_namaz_kitabi.pdf", "assets/nm.png"),
    BookListDart(BookName().islamExlaqi, BookName().MuhammedHadimi , "https://www.gozelislam.com/uploads/files/2019-05/1558977793_islam-exlaqi.pdf", "assets/ia.png"),

  ];

  static List<EBookTile> BookListView1  = [
   EBookTile("assets/nm.png", BookName().namazKitabitr, BookName().HasanYavas, "namaz-kitabi.epub"),
    EBookTile("assets/ia.png",BookName().islamAhlaki, BookName().Hocamiz , "islam-ahlaki.epub", ),

    EBookTile("assets/elmihal.png", "Tam Elmihal Səadəti Əbədiyyə I hissə", BookName().Hocamiz , "tam-ilmihal-seadet-i-ebediyye-birinci-kism.epub", ),
    EBookTile("assets/elmihal.png", "Tam Elmihal Səadəti Əbədiyyə II hissə", BookName().Hocamiz , "tam-ilmihal-seadet-i-ebediyye-ikinci-kism.epub", ),
    EBookTile("assets/elmihal.png", "Tam Elmihal Səadəti Əbədiyyə III hissə", BookName().Hocamiz , "tam-ilmihal-seadet-i-ebediyye-ucuncu-kism.epub", ),
    EBookTile("assets/sn.png", BookName().sevahidunNubuvve, BookName().Hocamiz , "sevahid-un-nubuvve-peygamberlik-mujdeleri.epub", ),
    EBookTile("assets/ky.png", BookName().qiymetsizyaz, BookName().Hocamiz , "kiymetsiz-yazilar-kiymeti-bulunamiyan-yazilar.epub", ),
    EBookTile("assets/mcyg.png", BookName().menakib, BookName().Hocamiz , "menakib-i-cihar-yar-i-guzin.epub", ),
    EBookTile("assets/mektubat.png", BookName().mektubat, BookName().iRQS , "mektubat-tercemesi.epub", ),
    EBookTile("assets/ka.png", BookName().kiyametveaxiret, BookName().Hocamiz , "kiyamet-ve-ahiret.epub", ),


  ];



}