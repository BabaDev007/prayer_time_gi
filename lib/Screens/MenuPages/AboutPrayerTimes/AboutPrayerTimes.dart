
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:prayer_time_gi/Constants.dart';
class AboutPrayerTimes extends StatelessWidget {


  final String _markdownData = """
  >"**NAMAZ VAXTLARI VƏ ONLARIN HESABLAMA QAYDALARI**"
 > Aqil və büluğ olan, yəni ağıllı olub evlənmə yaşına gəlmiş olan hər müsəlman kişinin və qadının hər
  gün beş vaxt namazı vaxtlarında qılması fərzdir. Bir namaz vaxtının
  başladığı zamana o namazın vaxtı deyilir. Bir namaz vaxtı gəlmədən əvvəl
  qılınarsa, səhih olmaz. Həm də böyük günah olar. Namazın səhih olması
  üçün vaxtında qılınması lazım olduğu kimi, vaxtında qıldığını bilmək,
  şübhə etməmək də fərzdir.

  > Hədisi-şərifdə **"Namaz vaxtının bir əvvəli vardır, bir də sonu vardır"** buyuruldu. 
  Bir məhəldə bir namaz vaxtının əvvəl vaxtı günəşin o məhəllin zahiri üfüq xəttindən bəlli bir irtifaya (yüksəklik) gəldiyi vaxtdır. Üzərində yaşadığımız
  **"Yer kürəsi"** öz oxu ətrafında, boşluqda dönür. Bu ox Yerin mərkəzindən keçən və Yerin səthini \[üzünü\] iki nöqtədə keçən bir düz xətdir. Bu iki nöqtəyə **"Yerin qütbləri"** deyilir. Günəşin və ulduzların üzərində hərəkət etdikləri zənn olunan kürəyə **"Səma kürəsi"** deyilir. Günəş hərəkət etməz. Lakin Yer kürəsi döndüyü üçün
  günəş sanki hərəkət edir. Ətrafımıza baxdıqda yer ilə göy böyük bir
  dairənin qövsü üzərində birləşmiş kimi görünür. Bu dairəyə **"Üfüqi
  zahiri xətt"** deyilir. Günəş səhərlər bu xəttin şərq tərəfindən doğur.
  Səmanın ortasına doğru yüksəlir. Günorta vaxtı təpəyə qədər yüksəlib
  təkrar alçalmağa başlayır. Sonra üfüqi zahiri xəttin qərb tərəfində bir
  nöqtədə batır. Üfüqi zahiri xəttindən etibarən ən yüksək olduğu vaxt
  **"Zəval vaxtı"**dır. Bu vaxta günəşin "Üfüqi zahiri xəttindən" olan
  yüksəkliyinə günəşin **"Qayəyi-irtifa"**sı deyilir. Səmaya baxan insana
  **"Müşahidəçi"** deyilir. Müşahidəçinin ayaqlarından keçən Yerin radius
  istiqamətinə müşahidəçinin **"Şaqul"**ü deyilir. Müşahidəçi yer
  kürəsinin xaricində hər hansı bir yüksəklikdəki bir M nöqtəsindədir. ME
  xətti müşahidəçinin şaqülüdür. Bu şaqulə dik olan müstəvilərə
  müşahidəçinin **"Üfüq müstəvisi"** deyilir. Altı ədəd üfüq müstəvisi
  var: 27-ci səhifədəki rəsmdə 3 nömrəli müşahidəçinin ayaqlarından keçən
  MF **"Riyadi üfüq"** müstəvisi; Yer kürəsinə təmas edən BN **"Hissi
  üfüq"** müstəvisi; 3- Müşahidəçinin ərtafını çevirən **"Zahiri üfüq
  xətti"** dairəsinin \[LK dairəsinin\] çizildiyi LK müstəvisi **"Meri
  üfüq"**müstəvisi 4- Yerin mərkəzindən keçən **"Həqiqi üfüq"**
  müstəvisi.5- Müşahidəçinin olduğu yerin ən yüksək nöqtəsinin Pq zahiri
  üfüq xəttindən keçən şəri üfüq müstəvisidir ki, bu müstəvinin yer
  kürəsini kəsdiyi dairəyə bu müşahidəçinin **"Şəri üfüq xətti"** deyilir.
  Bu beş müstəvi birbirlərinə paraleldir. 6- Bunlara paralel olmayan
  **"Səthi üfüq müstəvisi"** vardır. Müşahidəçinin olduğu yer yüksəldikcə
  "Zahiri üfüq xətti" böyüyür və həqiqi üfüq xəttinə yaxınlaşır. Buna görə
  də bir şəhərdə müxtəlif yüksəkliklər üçün bir namazın müxtəlif vaxtları
  olur. Halbuki bir şəhərdə bir namazın tək bir vaxtı vardır. Bu səbəbdən
  namaz vaxtları üçün zahiri üfüq xətləri istifadə olunmaz. Yüksəklik ilə
  dəyişməyən "Şəri üfüq" xəttindən olan Pq şəri yüksəklik istifadə olunur.
  Hər üfüq müstəvisinin səma kürəsini kəsdiyi dairələrə bu üfüqün "xətti"
  deyilir. Müşahidəçinin olduğu yer yüksəldikcə "Zahiri üfüq xətti"
  dairəsi böyüyür. Hər məhəllin altı üfqündən üçü üçün bir namazın bir
  vaxtı vardır: Həqiqi, zahiri və şəri vaxtlar. Bunlardan hər birinin
  Riyadi və Meri qisimləri var. Riyadi vaxtlar günəşin irtifasından
  hesabla tapılır. Meri vaxtlar riyadi vaxtlara 8 dəqiqə 20 saniyə əlavə
  edilərək hasil olur. Çünki işıq günəşdən Yerə 8 dəqiqə 20 saniyədə
  gəlir. Günəşi görərək də məlum olur. Riyadi və həqiqi vaxtlarda namaz
  qılınmaz. Namazlar meri vaxtlarda qılınır. Riyadi vaxtlar meri vaxtların
  tapılmasına vasitə olurlar. Günəşi görənlər üçün bir namazın zahiri meri
  vaxtı, görməyənlər üçün hesabla tapılan şəri meri vaxt istifadə edilir.
  Zahiri meri vaxt günəşin ön kənarının bu məhəldəki zahiri üfüq xəttinə
  nəzərən bu namaz vaxtına məxsus olan irtifaya gəldiyi görüldükdə
  başlayar. Bu irtifaya **"Zahiri irtifa"** və bu vaxta **"Zahiri vaxt"**
  deyilir. Şəri vaxt, günəşin ön kənarından şəri üfüq xəttinə nəzərən bu
  namazın irtifasına gəldiyi hesab edərək məlum olur. Zahiri üfüqlərə
  nəzərən olan irtifa dərəcələri gündüz günəş doğarkən başlayar. Gecə
  günəşin qürub etdiyi zahiri üfüqdən başlayar. Şəri üfüq günortadan əvvəl
  həqiqi üfüqdən əvvəldir. Tulu və qürub vaxtlarında günəşin irtifası
  sıfırdır. Fəcri-sadiq vaxtının başlama irtifası dörd mazhəbdə də üfüqi
  zahiri xəttinin şərq tərəfindən -19 dərəcədir. İşa namazı vaxtının
  başlaması irtifası İmamı-azama görə üfüqi zahiri xəttinin qərb
  tərəfindən -19 dərəcə, iki imama və digər üç məzhəbə görə -17 dərəcədir.
  Günəşin mərkəzinin üfüqi həqiqidən qayə irtifasına yüksəldiyi görülüncə
  meri həqiqi **"Zəval vaxtı"** olur. Günəşin ön və arxa kənarlarının qayə
  irtifalarına gəldiyi kölgə uzunluqları eyni olub, vaxtları fərqlidir. Bu
  iki vaxtın ortalamasında zəvali saat cihazlarının ayarı 12 edilir. Bu
  vaxt hesab ilə tapılan riyadi zəval vaxtından 8 dəqiqə 20 saniyə
  sonradır və yerə dik çubuğun kölgəsinin ən qısa olduğu vaxtdır. Günorta və ikindi vaxtlarının irtifaları hər gün
  dəyişir. Bu iki irtifa hər gün yenidən təyin edilir. Bir bölgədə günəşin
  həqiqi qayə irtifa dərəcəsi, o bölgənin enlik dərəcəsinin təmamisi ilə o
  günki meyli-şəmsin riyazi cəmidir. Günəşin kənarının zahiri üfüq
  xəttindən namazın irtifasına gəldiyi vaxt görülə bilinmədiyi üçün fiqh
  kitabları bu meri vaxtın əlamətlərini, işarətlərini bildirməkdədir.
  Səmada bu əlamətləri görə bilənlər namazlarını bu meri **"Zahiri
  vaxtlar"**da qılar**.** Günəşi və ya zahiri vaxtların əlamətlərini görə
  bilməyənlər və təqvim hazırlayanlar günəşin kənarının şəri üfüqlərə görə
  olan "riyadi şəri" irtifalara gəldiyi vaxtlar hesab edər. Namazlarını
  saata baxaraq bu **"Riyadi şəri vaxtlar"**da qılarlar. Saat cihazlarının
  bu riyadi şəri vaxtları göstərdiyi vaxt **"meri şəri"** vaxt olur.
  Namazlar bu meri vaxtlarda qılınmış olur.

  > **İzah**: Hesablama ilə günəşin şəri üfüqə nəzərən irtifa nöqtəsinə gəldiyi riyadi vaxtlar tapılır.
   Günəşin bu riyadi vaxta gəldiyi bu riyadi vaxtdan 8 dəqiqə 20 saniyə sonra görünür
  ki, bu vaxt meri vaxtdır. Yəni meri vaxt riyadi vaxtdan 8 dəqiqə 20
  saniyə sonradır. Saat cihazlarının başlanğıcları, yəni həqiqi zəval və
  şəri qürub vaxtlarının sıfır olduğu vaxtlar meri vaxtlar olduğu üçün
  saat cihazlarının ayarları riyadi vaxt sıfır olduqdan 8 dəqiqə 20 saniyə
  sonra sıfır olduqları üçün saat cihazlarının göstərdikləri riyadi
  vaxtlar meri vaxtlar olur.

 > Şəri vaxtlar hesablama ilə tapıldığı və təqvimlərdə riyadi yazılı olduğu
  halda saat cihazlarında meri vaxtlar vəziyyətinə dönməkdədir. Hesablama
  ilə əvvəlcə günəş mərkəzinin həqiqi üfüq xəttinə görə namazın irtifasına
  gəldiyi **"Riyadi həqiqi vaxtlar"** tapılır. Bunlara sonra təmkin əlavə
  olunaraq **"riyadi şəri"** vaxtlara çevrilir. Saat cihazlarında riyadi
  vaxtlara 8 dəqiqə 20 saniyə əlavə etmək lazım olmaz.

 ![Alt text](resource:assets/image1.png )


 > K = Günəşin mərkəzindən keçən Səmt müstəvisinin LK zahiri üfüq xəttini
  kəsdiyi nöqtə. MS = Yer kürəsinə K nöqtəsində toxunan üfüqihissi
  müstəvisinə Rasidin **"Üfüqi-səthi"** deyilir. HK=Günəşin kənarının
  üfüqi-zahiri xətti üzərindəki K nöqtəsindən irtifasıdır. Bu irtifa
  günəşin səthi üfüqə nəzərən ZS irtifasına bərabərdir.

  D = C = Ç = Üfüqün alçalma dərəcəsi.

  M = Məhəllin hər hansı bir yüksək yeri.

  ZMF= Günəşin riyadi irtifa dərəcəsi.

  > ZS = Günəşin səthi üfüqə nəzərən irtifasını göstərən, səmadakı səmt
  > dairəsi qövsüdür. Bu qövsün dərəcəsi, HK qövsünün dərəcəsinə
  > müsavidir.
  >
  > O = Üfüqi həqiqi ilə üfüqi səthinin kəsişdiyi doğru nöqtələrindən
  > biri.
  >
  > 1- Üfüqi həqiqi, 2-Üfüqi hissi, 3- Üfüqi riyadi, 4-Üfüqi səthi
  > müstəvisi, 5-Üfüqi zahiri xətti. 6- Üfüqi şəri xətti.
  >
  > G = Günəşin mərkəzinin görünüşü.
  >
  > GA= Günəşin həqiqi irtifa qövsü.
  >
  > B= Məhəllin ən alçaq yeri.

  >Hər hansı yüksəklikdə olan müşahidəçinin o məhəllin dərə və dəniz kimi
  ən aşağı nöqtələri ilə səmanın birləşmiş kimi gördüyü dairəyə
  müşahidəçinin **"Zahiri üfüq xətti"** deyilir. Bu dairədən keçən üfüq
  müstəvisinə bu yüksəkliyin **"Üfüqi meri"**si deyilir. Müşahidəçinin
  olduğu məhəllin ən aşağı yerinə, yəni Yer kürəsinin səthinə təmas edən
  BN üfüq müstəvisinə müşahidəçinin **""Üfüqi hissə"**si deyilir.
  Müşahidəçinin olduğu M nöqtəsindən keçən və Yer kürəsinə K nöqtəsində
  təmas \[dəyən\] MS müstəvisinə müşahidəçinin **"Səthi üfüq"**ü deyilir
  ki, müşahidəçinin gözündən çıxan şüa istiqamətidir. Bir məhəldəki
  müxtəlif yüksəkliklər üçün müxtəlif səthi üfüqlər vardır. Hər biri üçün
  günəşin ayrı irtifaları vardır. Bəlli bir yüksəkliyə məxsus olan bir
  səthi üfüq müşahidəçinin şaquli ətrafında dövr edərsə, Yer kürəsinə
  təmas edən K nöqtələri zahiri üfüq xəttini meydana gətirirlər.
  Müşahidəçi məhəllin ən yüksək nöqtəsində ikən zahiri üfüq xəttinə
  **"Şəri üfüq"** deyilir. Yer kürəsinin mərkəzindən keçən AE üfüq
  müstəvsinə müşahidəçinin **"Üfüqi həqiqi"**si deyilir. Mərkəzində Yer
  kürəsi olan və üzərində günəşlə ulduzların olduqları düşünülən böyük
  kürəyə **"Səma kürəsi"** deyilir. Günəşdən keçən ZMS səmt müstəvisi
  səthi üfüqlərdən birini kəsər. Səmt müstəvisi və səthi üfüq müstəviləri
  M-dən keçdikləri üçün səmt müstəviləri ilə səthi üfüq müstəviləri
  bir-birilərini bir düz xətt üzərində kəsərlər. Bu MS düz xəttinə
  **"Səthi üfüq xətti"** deyilir.Bu xətt K nöqtəsində EK radisuna dikdir
  və müşahidəçinin gözündən keçər. Səmt müstəvisinin səma kürəsini
  kəsdiklərini düşünsək, kürə səthində hasil olan bu dairələrə bu məhəllin
  **"Səmt dairələri"** və ya **"İrtifa dairələri"** deyilir. Bu dairələr
  bu məhəllin üfüq müstəvilərindən beşini dik olaraq kəsərlər. Günəşin
  mərkəzindən keçən səmt dairəsinin həqiqi üfüq müstəvisini kəsdiyi A
  nöqtəsi ilə günəşin mərkəzi arasında AG qövsinin dərəcəsinə günəşin o
  məhəldə və o andakı **"Həqiqi irtifa"**sıdeyilir. Şəms hər an başqa səmt
  dairələrindən keçməkdədir. Şəmsin bir Z kənarından keçən səmt dairəsinin
  bu kənarı kəsdiyi Z nöqtəsi ilə hissi, meri, səthi, riyadi və həqiqi
  üfüq müstəvilərini kəsdiyi iki nöqtə arasında qalan səmt qövsünün
  dərəcəsinə günəşin bu üfüqlərə görə **"İrtifa"**ları deyilir. Şəmsin bu
  üfüqlərdən eyni irtifada olduğu vaxtlar fərqlidir. Günəş bir məhəllin
  səthi üfüqün altına girdiyi zaman, yəni bu üfüqə nəzərən irtifa sıfır
  olunca bu üfüqün hər yerindəki müşahidəçilər günəşin bu üfüqdən qürub
  etdiyini görürlər. Yüksəkdə olan müşahidəçi LK öz üfüqi-zahirisi
  xəttinin bir K nöqtəsindən keçən üfüqi-səthidən qürubunu görür. LK
  üfüqi-zahiri dairəsinin hər nöqtəsindən keçən bir səthi üfüq müstəviləri
  var. Günəşdən keçən ZS səmt dairəsi bu üfüqlərdən birini S nöqtəsində
  dik olaraq kəsər. K nöqtəsindəki MKO səthi üfüqi Rasidin **"Səthi
  üfüq"**üdür. Səthi üfüq və MF riyadi üfüq müşahidəçinin olduğu eyni
  müstəvi içində eyni yüksəklikdən keçir. Lakin aralarında bir C bucağı
  var. Bu bucağa **"İnhitatı üfüq zaviyəsi** (bucağı)**"** deyilir.Əhməd
  Ziya bəy deyir ki, "müşahidəçinin olduğu məhəllin üfüqi-hissədən mert
  olaraq irtifanın kvadrat kökü 106,92-yə vursaq, bu məhəllin
  inhitatı-üfüq dərəcə saniyəsi olur". Yüksəkdəki Rasidə nəzərən günəşin
  qürub etməsi üfüqi-səthiyə nəzərən irtifanın sıfır olmasıdır. Digər
  namazlar zəvaldan sonra olduqları üçün bunların şəri vaxtları da bunun
  kimidir. Yəni günəşin səthi üfüqə nəzərən irtifaları ilə hesab edilir.
  Günəşin səthi üfüqə nəzərən "ZS" irtifası müşahidəçinin olduğu məhəllin
  şaqulündən keçən səmt dairələrindən günəşin kənarından keçən dairənin
  qövsüdür. Bu qövs müşahidəçinin gözündən çıxıb, bu qövsün iki ucundan
  keçən iki ox arasındakı zaviyənin dərəcəsini göstərir. Bu qövsə paralel
  olaraq zaviyənin iki kənarı arasındakı çəkilən saysız miqdarda qövslərin
  hamısı da günəşin bu irtifa dərəcəsini göstərir. Müşahidəçi bu
  qövslərdən səthi üfüqün üfüqi-zahiri xəttini kəsdiyi K nöqtəsindən keçən
  HK qövsünü günəşin səthi üfüq xəttinə nəzərən olan HK **"zahiri
  irtifası"** istifadə olunur. Bu irtifa həqiqi üfüqə görə olan ZA irtifa
  ilə hesab edilməkdədir. Şəmsin zahiri irtifası sekstant və rubı dairə
  taxtası ilə tapılmaqdadır.

  >Yer oxunun səma kürəsini kəsdiyi iki nöqtəyə **"Səmt qütbü"**
  deyilir.Oxdan keçən müstəvilərin səma kürəsində hasil etdikləri
  dairələrə **"Meyl dairələri"** deyilir. Yer mərkəzindən keçən və oxa dik
  olan müstəviyə **"Ekvator"** səthi deyilir. Günəşin mərkəzi ilə Ekvator
  arasında qalan meyl dairəsi qövsünün dərəcəsinə **"Günəşin meyli"**
  deyilir.

 > Bir məhəldə bir meyl müstəvisi və bir çox səmt müstəviləri var. Bir
  məhəllin şaquli ilə Yerin oxu Yerin mərkəzində birləşir. Əmələ
  gətirdikləri bucağın müstəvisinə **"Nısf-ün-nəhar müstəvisi"** deyilir.
  Bu müstəvinin səma kürəsini kəsdiyi dairəyə **"Nısf-ün-nəhar
  dairəsi=Meridian"**, həqiqi üfüqü kəsdiyi xəttə **"Nısf-ün-nəhar
  xətti"** deyilir. Günəşin gündəlik orbitləri bir-birilərinə və Ekvator
  müstəvisinə paralel olan dairələrdir. Bu dairələrin yerləşdikləri müstəvilər Yerin oxuna və
  Nıfs-ün-nəhar müstəvisinə dikdirlər. Üfüq müstəvilərini maili olaraq
  kəsərlər. Günəş bir məhəllin üfüqi-zahiri xətti üzərində qaldığı zaman o
  məhəldə şəmsi gündüz olur. Günəşdən keçən səmt dairəsi üfüqi-zahiri
  xəttini dik olaraq kəsir. Günəş bir məhəllin Nısf-ün-nəhar dairəsi
  üzərinə gəldikdə, yəni mərkəzi həqiqi üfüqdən qayə irtifasında olduğu
  zaman mərkəzindən keçən meyl dairəsi ilə o məhəllin səmt dairəsi eyni
  olur. Bu dairənin günəş mərkəzi ilə Ekvator arasındakı qövsü **"Meyl",**
  üfüqi-həqiqi arasındakı qövsü **"Həqiqi qayə irtifası"** dərəcəsi olur.
  Müşahidəçi Ekvatordadırsa, həqiqi üfüqü Yerin oxundan keçər. Hər zaman
  gecə və gündüz on iki saat olur. Müşahidəçi Qütblərdədirsə, həqiqi üfüq
  müstəvisi Ekvator müstəvisi ilə eyni olur və günəş müşahidəçinin olduğu
  yarım kürədə ikən altı ay gündüz, digər yarım kürədə olduğu zaman altı
  ay gecə olur. Günəşin illik hərəkətini etdiyi **"Husuf müstəvisi"**
  Ekvator müstəvisini Yerin bir diametri istiqamətində kəsər. Aralarında
  daima 23 dərəcə 27 dəqiqə bucaq var. Günəş Ekvatorun bir tərəfində ikən
  bu məhəllərdə yay, digər yarım kürədə qış olur.

  > Sübh namazının vaxtı dörd məzhəbdə də **"Lehli-şəri"** sonunda, yəni **"Fəcri-sadiq"** deyilən bəyazlığın
  şərqdəki üfüqi-zahiri xəttinin bir nöqtəsində görülməsindən
  **"Leyli-şəmsi"**nin sonuna, yəni günəşin üst kənarının o məhəldəki
  üfüqi-zahiri xəttindən doğana qədərdir. Bəyazlıq üst kənarı bir məhəllin
  üfüqi-zahiri xəttinə 19 dərəcə yaxınlaşdıqca bir nöqtədə görünür. Oruc
  da bu vaxt başlayır. İslam alimləri -19 dərəcə irtifa ilə hesab
  etdikləri imsaq vaxtlarının buludsuz və aydın havada üfüqi-zahiri
  xəttinə və saata baxaraq bəyazlığın üfüqi-zahiri xəttinin bir nöqtəsində
  başladığı vaxt ilə eyni olduqlarını görmüşlər. Biz də belə gördük. Ona
  görə də oruc tutmağa bu vaxtdan sonra başlayanların orucları səhih
  olmur. Daha sonra irtifa -18 olduğu zaman bəyazlıq bu üfüq xətti üzərinə
  yayılır. Sübh namazını bu vaxtda qılmaq ehtiyatlı olar. Avropalılar bu
  vaxta fəcr deyirlər. Müsəlmanların din işlərində xristianlara deyil,
  islam alimlərinə tabe olması lazımdır. Bəyazlığın üfüq xətti üzərində
  qırmızılığın başlamasından iki dərəcə əvvəl başlayır. -20 dərəcə
  yaxınlaşdıqda bəyazlığın başladığını bildirənlərin də olduğu İbni
  Abidində və M.Arif bəyin təqvimində yazılıdırsa da islam alimləri -19
  dərəcə olduğunda ittifaq etmişlər. Qırmızılığın yayılması günəşin üst
  kənarı üfüqi-zahiri xəttinə 16 dərəcə yaxınlaşdığı zaman baş verir. Fəcr
  və imsaq vaxtı üçün -16 dərəcə irtifanı qəbul etmək islam alimlərinə
  tabe olmamaq deməkdir.

 > Zahiri zöhr məhəlli ilə həqiqi zöhr məhəlli eyni deyil. Günəşi görənlər
  üçün zöhr namazının əvvəl meri vaxtı günəşin arxa kənarı zahiri zəval
  məhəllindən ayrıldığı zaman başlayır. Bu vaxt günəşin arxa kənarının
  üfüqi şəri xəttindən qayə irtifasına yüksəldiyi vaxtdır və feyyi
  zəvaldan, yəni dik bir çubuq kölgəsinin ən qısa ikən uzanmağa
  başladığını görməklə məlum olur. Bu vaxt günəş mərkəzinin o məhəldəki
  gündüz müddətinin ortasından \[səmadakı Nısfün-nəhar dairəsindən\], yəni
  həqiqi üfüq xəttinə görə həqiqi qayə irtifasına yüksəldikdən, yəni
  **"Həqiqi zəval vaxtı"**dan sonra arxa kənarının Yer üzərindəki üfüq
  xəttinin qərb tərəfindən zahiri qayə irtifasına endiyi görüldüyü zaman
  başlayar. Günəşi görənlər üçün namaz vaxtlarının \[günəşin mərkəzinin\]
  üfüqi-həqiqiyə nəzərən olan həqiqi irtifaları ilə deyil, arxa kənarının
  üfüqişəri xəttinə qədər zahiri irtifasına gəldiyi, yəni namaz vaxtının
  həqiqi irtifasına gəlməsindən sonra təmkin zamanı keçdiyi görüldüyü
  zaman başlayacağı Tahtavinin **"İmdad haşiyəsi"**ində yazılıdır. Zahiri
  zöhr vaxtının günəşin şəri qayəyi-irtifadan alçaldığı görüldüyü vaxt
  başladığı **"Məcmaul ənhür"**də də yazılıdır. Ətrafımızda bir dairə
  şəklində gördüyümüz **"zahiri üfüq xətti"** dairəsinin məhəlli
  müşahidəçi ən aşağı yerdə ikən üfüqi-hissi üzərində bir B nöqtəsidir.
  Səmada zahiri qayə irtifaındakı **"Zahiri zəval məhəlli"** də səmadakı
  zahiri zəval nöqtəsi olur. Müşahidəçi insan boyu qədər belə yüksəldikcə
  üfüqi-zahiri xətti üfüqihissidəki B nöqtəsinin ətrafında nısf qutru
  (radius) inhitatı-üfüq dərəcəsi qədər bir qövs olan bir dairə şəklini
  alır və üfüqi həqiqiyə doğru alçalır. Səmadakı zahiri zəval məhəlləri də
  üfüqi zahiri xəttindən qayə irtifasında olan nöqtə arasındakı xətt qövsü
  olur. Bu zəval dairələri Nısf-ün-nəhar müstəvisinə dikdir və nısf
  qutrları olan qövslər inhitatı-üfüqlər qədərdir. Zahiri zəval qövsünün
  başı və sonu günəşin gündəlik oxunun zahiri zəval dairəsini kəsdiyi iki
  nöqtədir. Günəşin ön kənarı birinci nöqtəyə gəldikdə kölgənin qısalması
  fərq edilməz zahiri zəval vaxtı başlayar. Arxa kənarı ikinci nöqtədən
  çıxdıqda tamam olur. Bu vaxt kölgənin uzanması başladığını görməklə
  məlum olur. **Zəval məhəlli dairələr"**indən hər biri Yer üzərindəki
  müşahidəçinin olduğu məhələ məxsus olan zahiri üfüq xətti dairəsinin
  nöqtələrindən eyni qayə irtifasında olan nöqtələrdən meydana gəlmişdir. **"Şəri zəval vaxtı"** günəşin ön
  kənarının bu dairələrin ən kənarındakı ən böyüyü üzərindəki iki nöqtədən
  birincisinə gəldiyi vaxt başlayar. Arxa kənar bu dairədən ayrılarkən
  şəri zəval vaxtı tamam olaraq **"şəri zöhr vaxtı"** başlayar. Riyadi
  şəri vaxtlar hesab ilə tapılaraq təqvimlərə yazılır. Zöhr vaxtı
  əsri-əvvələ qədər, yəni bir şeyin kölgəsi zəval vaxtındakı boyundan bu
  şeyin boyu miqdarı uzanana və ya əsri-saniyə, yəni boyunun iki misli
  uzanana qədər davam edər. Birincisi iki imama və digər üç məzhəbə görə,
  ikinci vaxt isə İmamı-azama görədir.

  >Əsr namazının vaxtı zöhr vaxtı bitən kimi başlayaraq günəşin arxa kənarı
  üfüqi-zahiri xəttindən batıb, qeyb olduğu görülənə qədər isə də, günəş
  saraldıqdan sonra, yəni alt \[ön\] kənarı üfüqi-zahiri xəttinə bir nizə
  boyu yaxınlaşdıqca hər namazı qılmaq və əsr namazını bu vaxta
  gecikdirmək haramdır. Günəşin və ya şüasının gəldiyi yerlərin saralması
  mərkəzinin üfüqi-həqiqiyə beş dərəcə irtifaya gəldiyi vaxt başlayar. Bu
  vaxta **"İsfirar vaxtı"** və ya **"Kərahət vaxtı"** deyilir. \[Günəşin
  ön kənarının üfüqi-şəridən ayrıldığı zaman başlayar\]. Bu vaxt üç
  kərahət vaxtının üçüncüsüdür. Türkiyədə, şəhərlərdə əsr namazının
  azanları iki imama görə oxunduğundan əsr namazını bu azandan qışda 36
  dəqiqə, yayda isə 72 dəqiqə sonra qılınmalıdır ki, beləcə İmamı-azama da
  tabe olunmuş olur. Enlik dərəcəsi 40 ilə 42 arasındakı məhəllərdə yanvar
  ayından başlayaraq hər ay üçün 6 dəqiqə 36-ya əlavə edildikdə, qışa
  doğru iyul ayından başlayaraq 72-dən çıxıldıqda bu aydakı iki əsr vaxtı
  arasındakı zaman fərqi olur.

  >Şam namazı şəmsi və şəri gecənin başlaması ilə birlikdə başlayar. Günəş
  zahiri qürub etdikdə, yəni üst kənarının müşahidəçinin olduğu məhəllin
  üfüqi-zahiri xəttindən qeyb olduğu görüldükdə başlayar. Hədisişərifdə,
  "**Gecə başladığı zaman orucu pozun! Gecənin başlaması günəş şüasının
  şərq tərəfində ən yüksək təpədən qeyb olması ilə olur"** buyuruldu. Bu
  hədisi-şərif və **"İbni Abidin"** və **"Tahtavi"**nin (rahmətullahi
  aleyhimə) açıqlamaları göstərir ki, günəşin zahiri üfüq xəttindən qürub
  etməsinin görülmədiyi yerlərdə və hesab edilərkən qürub günəş şüasının
  ən yüksək təpədən çəkildiyi meri şəri qürub vaxtıdır. Azanı-saat
  cihazları bu vaxt 12-ə qurulur. Şam namazının vaxtı şəfəq qaralana
  qədər, yəni qərbdə iki imama və digər üç məzhəbə görə qırmızılıq qeyb
  olana və ya İmamı-azama görə bundan iki dərəcə sonra bəyazlıq qeyb
  oluncaya qədər davam edər. Şam namazını vaxtın əvvəlində qılmaq
  sünnətdir. **"İştibaqi-nücum"** vaxtından, yəni ulduzların çoxaldıqdan,
  yəni günəşin arxa kənarının üfüqi-zahiri xətti altına on dərəcə irtifaya
  endikdən sonraya saxlamaq haramdır. Bu vaxt ilə qürub vaxtı arasındakı
  zaman İstanbul kimi enliyi 41 dərəcə olan məhəllər üçün bir ildə 53 ilə
  67 dəqiqə arasında dəyişməkdədir. Xəstəlik, səfəri olmaq, hazır təamı
  yemək üçün ulduzlar çox görülənə qədər gecikdirilə bilər.

  >İşa namazının vaxtı İmameynə görə işayı-əvvəldən, yəni qərbdəki zahiri
  üfüq xətti üzərindəki qırmızılıq qeyb olduqdan sonra başlayar. Digər üç
  məzhəbdə də belədir. İmamı-azama görə işayı-sanidən, yəni bəyazlıq qeyb
  olduqdan sonra başlayar, şəri gecənin sonuna, yəni Fəcri-sadiqin
  ağarmasına qədərdir. \[Günəşin üst kənarı zahiri üfüqdən 17 dərəcə
  irtifaya endikdə qırmızılıq, 19 dərəcə endikdə bəyazlıq qeyb olur.\]
  Şafii məzhəbində işa namazının axır vaxtı şəri gecənin, yəni qürub ilə
  fəcri-sadiq arasındakı zamanın yarısına qədər deyənlər var. İşanı şəri
  gecənin yarısından sonra qılmaq bunlara görə caiz deyil. Hənəfidə isə
  məkruhdur. Malikidə də fəcrə qədər qılmaq səhih isə də, şəri gecənin
  üçdə birindən sonra qılmaq günahdır. Zöhr və şam namazlarını iki imamın
  bildirdiyi vaxtlarda qıla bilməyən qəzaya saxlamayıb, İmamı-azamın
  qövlünə əsasən əda etməli, beləliklə də o gün əsr və işa namazlarını da
  İmamı-azama görə qılmalıdır.

  >Beş vaxt namazın, xüsusilə sübh və işa namazı vaxtlarının başlanğıcı hər
  məmləkətin arz \[Enlik\] dərəcəsinə, yəni xətti-istivadan (ekvator)
  uzaqlığına və günəşin meylinə, yəni ay və günlərə görə başqadır. Qütbə
  yaxınlaşdıqca fəcr və şəfəq vaxtları günəşin tulu \[doğma\] və qürub
  \[batma\] vaxtlarından uzaqlaşır. Yəni sübh və işa namazlarının ilk
  vaxtları bir-birinə yaxınlaşır. Tənvir səthi ilə Yerin oxu arasındakı
  **"Tənvir zaviyəsi"** günəşin meylinə müsavi olduğu üçün 90 - arz ≤ +19,
  yəni arz dərəcələri ilə meyli şəmsin toplamı yetmiş bir \[90-19=71\] və
  ya daha çox olan yerlərdə və zamanlarda, məsələn, Parisdə günəşin meyli
  çox olduğu iyunun 12-si ilə 30-u arasında şəfəq qırmızılığı qeyb olmadan
  fəcrin bəyazlığı başlayar. Bunun üçün işa və sübh namazlarının vaxtları
  başlamaz. **"Səadəti-əbədiyyə"** kitabının 175-ci səhifəsinə baxın!
  Hənəfi məzhəbində vaxt namazın səbəbidir. Səbəb olmazsa, namaz da fərz
  olmaz. O halda hənəfi məzhəbi alimlərinin çoxu bu cür məmləkətlərdə bu
  iki namaz fərz olmaz, dedilər. Bəzi alimlərə görə isə arz dərəcələri bunlara yaxın yerlərdəki və ya belə bir yerdə belə zamanların
  başlamadan əvvəlki günlərdəki vaxtlarında qılınmalıdır.

 > Nəharı-şərinin, yəni oruc vaxtının dörddə birinə elmi-nücum alimləri,
  yəni astronom alimləri **"Duha"** vaxtı deyirlər. Bu vaxt kərahət
  vaxtının sonudur. Din alimləri bu vaxta **"İşrak vaxtı"**,yəni quşluq
  zamanının başladığı vaxtdır, deyirlər. Duha vaxtında günəş mərkəzinin
  üfüqi-həqiqidən irtifası beş dərəcədir. Alt kənarı üfüqi-meridən bir
  nizə boyu irtifasındadır. Duha vaxtı günəşin tulundan təqribən 40 dəqiqə
  sonradır. Bu iki vaxt arasındakı zaman **"Kərahət zamanı"**dır.

 > Duha vaxtında hər gün iki rükət **"İşrak namazı"** qılmaqsünnətdir. Bu
  namaza **"Quşluq namazı"** da deyilir. Bayram namazı da bu vaxtda
  qılınır. Nəharı-şərinin yarısı **"Dahvəyi-kübra"** vaxtıdır. Azanı Fəcr
  vaxtının yarısı Dahvəyi-kübra vaxtıdır. Yerli saata görə gecə yarısından
  etibarən imsaq və iftar vaxtları cəminin yarısıdır.

  >Zöhr və əsr namazlarının vaxtlarını asan anlamaq üçün Muhamməd Məsum
  Faruqi Sərhəndinin tələbələrindən Abdulhaq Sücadilin (rahmətullahi
  aleyhimə) yazdığı farsca **"Məsaili-şərhi viqayə"** kitabının
  Hindistanda Heydəri mətbəəsində çap olunan 1294-cü \[miladi 1877\] il
  tarixli nəşrində və **"Məcmua-ülənhür"**də belə yazılır:\
  Günəş görünən düz bir yerə bir dairə çizilir. Bu dairəyə
  **"Dairəyi-hindiyyə"** deyilir. Dairənin ortasına dairə diametrinin
  yarısı qədər uzun, düz bir çubuq sancılır. Çubuğun təpəsi dairənin üç
  müxtəlif nöqtəsindən eyni uzaqlıqda olmalıdır ki, tam dik olsun! Bu dik
  çubuğa **"Miqyas"** deyilir. Bu miqyasın kölgəsi səhərlər dairənin
  xaricinə qədər uzanır və qərb tərəfində olur. Günəş yüksəldikcə, yəni
  irtifası artdıqca kölgə qısalır. Kölgənin dairəyə girdiyi nöqtəyə işarə
  qoyulur. Günortadan sonra şərq tərəfində dairədən çölə çıxar. Çıxdığı
  nöqtəyə də bir işarə qoyulur. Dairə çevrəsi üzərindəki bu iki işarə
  arasında qalan qövsün \[oxun\] ortası ilə dairənin mərkəzi arasında düz
  bir xətt çəkilir. Bu xətt o məhəllin **"nısf-ün-nəhar xətti"** olur.
  Nısf-ün-nəhar xəttinin istiqaməti şimal və cənub cəhətlərini göstərir.
  Günəşin doğduğu tərəfə dönən şəxsin sol çiyini şimal cəhətidir. Günəşin
  ön kənarı üfüqi zahiri xəttindən qayə irtifasına yüksəldikdə **"Zahiri
  zəval vaxtı"** başlayar. Bundan sonra kölgənin uzanıb qısaldığı hiss
  olunmaz. Kölgənin ən qısa uzunluğuna **"Feyi-zəval"** deyilir. Arxa
  kənar alçalmağa başlayaraq səthi üfüqə \[zahiri üfüq xəttinə\] nəzərən
  qayə irtifasına gəldikdə **"Zahiri zəval vaxtı"**nın sonu və **"Zahiri
  zöhr vaxt"** olur. Kölgənin uzanmağa başladığı görünür. Zahiri zəval
  zamanının, yəni kölgənin qısalmasının sonu ilə uzanmağa başlaması
  arasındakı zamanın ortasında günəşin mərkəzi səmadakı Nısf-ün-nəhar
  dairəsi üzərinə gəldiyi meri vaxt olub, həqiqi zəval vaxtında həqiqi
  zəvali saat 12-dir. 12 ilə tədili-zamanın riyazi cəmi gündüzün
  başlanğıcı edir. Bu vaxt məhəlli yerli saat 12 edilir. Zəvali-saat
  cihazlarının başlanğıcıdır. **"Həqiqi meri zəval vaxtı"** günəşin zəvala
  gəldiyi **"riyadi zəval vaxtı"**ndan 8 dəqiqə 20 saniyə sonradır. Çünki
  günəşin şüası Yerə 8 dəqiqə 20 saniyədə gəlir. Hesabla tapılan riyadi
  namaz vaxtlarına 8 dəqiqə 20 saniyə əlavə olunaraq meri vaxtlara
  çevrilir. Bu hesabi-saat cihazları vasitəsilə edilir. Riyadi vaxtların
  və saat cihazlarındakı meri vaxtların bir-birilərinin eyni olduqları
  anlaşılır.

  > 1193-cü \[m. 1779\] ildə Ərzurumda hazırlanmış **"Meyarı-əvkat"** cib təqvimində deyilir ki, "kölgənin ən
  qısa görüldüyü "meri" zəval vaxtında azanı-saat cihazı təqvimdə yazılı
  zöhr vaxtından təmkin zamanı geri alınaraq ayarı düzəldilir". Çünki
  zəval vaxtı zöhr vaxtından təmkin qədər əvvəldir. Azanı-saat cihazını
  ayarlamaq üçün vəsati saat cihazı hər hansı bir namaz vaxtını
  göstərdikdə azanı-saat cihazı da bu namazın azanı vaxtına gətirilir.
  Feyi-zəval enlik və uzunluq dərəcələrin görə, yəni hər enlik dərəcəsində
  və hər gün başqa şəkildədir.

  >Əsr namazı vaxtındakı günəş irtifasını tapmaq üçün "irtifa kölgə
  uzunluğu" cədvəlindən istifadə edilir. Bu cədvəli 1924 "Təqvimi-sal"
  sonunda görərək kitabımızın 238-ci səhifəsinə qoyduq. Məsələn, 13
  avqustda İstanbulda günəşin qayə irtifası 64 dərəcə olduğu üçün bir metr
  dik çubuğun kölgəsinin ən qısa uzunluğu cədvəldə 0,49 m. tapılır.
  Əsri-əvvəldə kölgə 1,49 m. və günəşin irtifası cədvəldə 34 dərəcə olur.

  >Pərgar feyi-zəval boyu qədər açılıb bir ayağı Nısf-ün-nəhar xəttinin
  dairəni kəsdiyi nöqtəyə qoyulur. Digər ayağının Nısf-ün-nəhar xəttinin
  dairə xaricindəki qismini kəsdiyi nöqtə ilə mərkəz arasındakı məsafə
  nısf qutr olmaqla ikinci bir dairə çəkilir. Miqyasın kölgəsi bu ikinci
  dairəyə gəldiyi vaxt **"həqiqi əsri əvvəl"** vaxtı olur. İkinci dairəni
  hər gün yenidən çəkmək lazımdır.

  >Şəri namaz vaxtlarını günəşin kənarının şəri üfüqdən olan irtifasına
  görə hesab etmək lazımdır. Namaz vaxtlarının irtifaları həqiqi üfüqdən
  ola bilməz. Həqiqi üfüqə görə olan irtifa ilə hesab edilən həqiqi qürub
  vaxtında günəş yüksək yerlərin zahiri üfüq xətlərindən batmamış olaraq
  görülür. Günəş mərkəzinin Nısf-ünnəhardan iki gündəki keçişləri, yəni
  iki gündəki həqiqi zəval vaxtları arasındakı zamana **"Həqiqi günəş
  günü"** deyilir. Bunların uzunluqları bir-birlərinə bərabər olmadığı
  üçün **"Yerli gün"** istifadə olunur. Yerli gün uzunluğu bir günəş
  ilindəki 365,24 günün 360-da biri qədər zamandır. Yerli günlər
  bir-birlərinə bərabərdir. Bunların həqiqi günəş günlərindən fərqinə bir
  günlük **"Tədili-zaman"** deyilir. Yerli gün artıqdırsa, tədili-zaman
  "-", əskikdirsə "+" dır. Tədili-zaman hər gün dəyişərək bir ildə +16 ilə
  -14 arasında dəyişməkdə, ildə dörd dəfə sıfır olur.

 > Günəşin mərkəzinin həqiqi üfüqdən qürub etdiyi **"riyadi qürub"**
  vaxtından sonra arxa kənarının üfüqi-şəriyə enərək şüasının ən yüksək
  təpədən qeyb olması üçün keçən zamana **"Təmkin zamanı"** deyilir. Bir
  bölgənin \[şəhər və ya kəndin\] təmkini yüksəklik ilə və coğrafi enliklə
  dəyişər, artar. Gündəlik dəyişməsi bir neçə saniyədir. Bütün namaz
  vaxtları və iftar vaxtı hesablanarkən hər bölgədə ən yüksək yerin
  təmkini istifadə edilir. Məsələn; İstanbulda, Çamlıca təpəsinin 267 metr
  yüksəkliyi üçün hesab edilən 8 dəqiqə təmkin istifadə edilir.
  Təmkinlərin hər gün dəyişməsi və müxtəlif saat qurşaqlarının
  bir-birilərindən fərqləri nəzərə alınaraq İstanbulun təmkini 10 dəqiqə
  qəbul edilmişdir. Günəşin tədili-zamanı və meyli isə hər gün təqribən
  yarım dəqiqə dəyişir. Lakin günlük miqdarı hər bölgədə eynidir.

  >Saat cihazları bir yerli gündə 24 saatı göstərir. Yerli və azanı
  zamanları ölçür. Bir bölgənin yerli saatı həqiqi meri zəval vaxtından
  tədili-zaman qədər fərqli olaraq 12 edilir. Azanı saat cihazı günəşin
  üfüqişərindən, yəni ən yüksək təpədən qürub etdiyi görüldüyü zaman 12
  edilir. Bu saat cihazları qürubi vaxtları göstərmir. Azanı vaxtları
  göstərir. Şərqə doğru gedildikcə, yəni meridian dərəcəsi artdıqca
  məhəlli saat cihazlarının ayarları irəli alınmaqda, bunun üçün tul
  dərəcələri dəyişdikdə saat cihazlarındakı namaz vaxtları
  dəyişməməkdədir. Qürubi və azanı gün uzunluqları bir-birilərinə təqribən
  bərabərdir. Mənbələri və təmkin miqdarı fərqlidir. Həqiqi \[zəvali\] gün
  uzunluğundan 1-2 dəqiqə fərqlidirlər. Hesab ilə namazların zəvali və ya
  qürubi riyadi vaxtları tapılır. Bu riyadi vaxtlar saat cihazlarının
  göstərdikləri meri vaxtlarıyla eynidir. Coğrafi enlik dərəcəsi artdıqca
  \[işa istisna olmaqla\] dörd namazın vaxtı əvvəl olur. Meridian dərəcəsi
  artdıqca məhəlli saatlardakı vaxtlar dəyişməzsə də müştərək saata görə
  meridian dərəcəsi artdıqca irəli \[əvvəl\] olur.

  > İbni Abidin oruclunun etməsi müstəhəb olan şeyləri bildirərkən və Tahtavi **"Məraqıl-fəlah"**
 haşiyəsində namaz vaxtlarında buyururlar ki, "Bir şəxs günəşin üst kənarının
 zahiri üfüq xəttindən qürub etdiyini görmədikcə iftar edə bilməz.
 Alçaq yerdə olan şəxs qürubu daha öncə gördükdə yüksəkdəki
 adamdan daha öncə iftar edər. Günəşin üfüqi-zahiri xəttindən qürubunu
 görə bilməyənlər üçün qürub şərqdəki təpələrin qaralmasıdır". Yəni şəri üfüqdən olan qürubdur. Namaz vaxtları və iftar etmək hesablanarkən
 **"Təmkin"** istifadə etmək, yəni irtifaları şəri üfüqlərə görə düşünmək lazım olduğu buradan məlum olur. Hesab edərkən hər yüksəklik üçün ayrı
 olan zahiri üfüq xətlərindən olan zahiri irtifalar istifadə edilmir.
 Çünki müxtəlif zahiri üfüq xətləri və bunların hər birinə görə müxtəlif irtifalar və bir məhəldə bir namazın müxtəlif riyadi vaxtları olur.

 > Günəşin kənarının şəri üfüqdən namaz vaxtının irtifasına gəldiyi riyadi
  vaxtını hesab etmək üçün əvvəlcə bu namaza məxsus olan
  **"Fadlı-dair=zaman fərqi"** hesab edilir. Fadlı-dair günəşin olduğu yer
  ilə gündüz və ya gecə yarıları arasındakı zaman fərqidir. Fadlı-dairi
  tapmaq üçün müxtəlif düsturlar \[formullar\], loqoritm ilə və ya hesab
  cihazları ilə hesablanır. Zöhr, əsr, isfirar, şam, iştibaq və işa
  vaxtlarının Fadlıdairləri \[saat cihazlarının göstərdiyi meri\] həqiqi
  zəval vaxtına əlavə olunaraq bəzi cihazlarda tapılan işa namazının
  Fadlı-dairi gecə yarısından çıxarılaraq həqiqi və ya qürubi zamanlara
  nəzərən riyadı **"Həqiqi vaxtlar"** tapılır. Zöhr, əsr, şam, iştibaq və
  işanın həqiqi vaxtlarına təmkin əlavə və fəcr ilə tulu riyadi həqiqi
  vaxtlarından çıxıldıqda **"Şəri vaxtlar"** olur.Çünki bir namazın həqiqi
  vaxtı ilə şəri vaxtı arasındakı zaman fərqi həqiqi üfüq ilə şəri üfüq
  arasındakı zaman fərqi qədərdir. Bu da **"Təmkin zamanı"**dır. Hər şəhər
  üçün tək bir təmkin vardır. Bu da şəri vaxtları tapmaq üçün istifadə edilir.
  Bunlar da **"Azanı"** və ya **"Yerli"**zamanlara çevrilərək təqvimlərə
  yazılır.  Həqiqi vaxtı yerli vaxta çevirmək üçün "Tədili-zaman"dan
  istifadə edilir. Qürubi vaxtı azana çevirmək üçün daima bir **"təmkin"**
  çıxarılır. Görünür ki, zöhr, əsr, şam və işa namazlarının qürubi
  vaxtları ilə azanı vaxtlar bir-birinin eynidirlər. İslam alimləri
  əsrlərlə əvvəl **"Rubıdairə"** aləti və Üstürlab \[Oqtant\] deyilən alət
  düzəldərək bununla günəşin riyadi üfüqə görə və ya Sekstant ilə zahiri
  üfüq xəttinə görə irtifasını ölçmüşdürlər, bundan hər namaz vaxtının
  həqiqi irtifasını hesab etmişdirlər. Zəvaldan əvvəlki vaxtlar şəri tulu
  üfüqünə zəvaldan sonrakı vaxtlar şəri qürub üfüqünə olan irtifaları ilə
  hesab edilir. Zöhr vaxtı gündüz ortasından sonra olduğu üçün **"Şəri
  zəval vaxtı"** həqiqi zəval vaxtından təmkin zamanı sonra olması
  lazımdır. Hüsaməddin əfəndinin **"Şəmaili-şərifə"** tərcüməsinə baxın!
  Əhməd Ziya bəy 1339 \[1921\] tarixli **"Rubı-dairənin surəti istimali"**
  kitabında deyir ki, "Həqiq meri zəval vaxtındakı 12 saata uyğun olan
  yerli vaxta o bölgəyə aid təmkin miqdarı cəm olunduqda məhəlli yerli
  saat ilə şəri zöhr vaxtı olur". **"Kədusi"**nin **"İrtifa risaləsi"**ni
  tərcümə edən Fateh mədrəsəsi dərsi-amlarından, yəni islam elmləri
  ordinar professoru Hezarqradlı Həsən Şevqi əfəndi 9-cu babında imsaq
  vaxtını tapmağı bildirərkən deyir ki, "Hesabladığımız imsaq vaxtları
  təmkinsizdir. \[Yəni günəşin mərkəzinin qürubi saata görə həqiqi üfüqə
  -19 dərəcə irtifaya yaxınlaşdığı \[riyadi\] vaxtdır\]. Oruc tutacaq
  şəxsin bundan iki təmkin miqdarı \[on beş dəqiqə\] əvvəl imsaq etməsi
  lazımdır. Beləcə \[oruca günəşin ön kənarının şəri üfüqə və azanı saata
  görə olan imsaq vaxtında başlayaraq\] orucu fasid olmaqdan qurtular".
  Görünür ki, bu böyük alim də şəri azanı vaxtı tapmaq üçün həqiqi vaxtdan
  təmkin zamanının iki mislini çıxmaqda, təmkin çıxarılmazsa, orucun fasid
  olacağını bildirməkdədir. Çünki İstanbulda təmkin səkkiz dəqiqə hesab
  edilməkdə ehtiyatən on dəqiqə qəbul olunmaqdadır. Əhməd Ziya bəy də
  "Rubı-dairə ilə tapılan həqiqi fəcr vaxtından təmkinin iki mislini
  çıxdıqdan sonra azanı şəri imsaq vaxtı başlayar" deyir. İki təmkindən
  biri həqiqi vaxtı şəri vaxta çevirmək üçündür. İkincisi qürubi saatı
  azaniyə çevirmək üçündür. Hesab ilə və ya Rubı-dairə ilə tapılan həqiqi
  fəcr vaxtından azanı saat üçün təmkin zamanının iki mislini çıxarmağın,
  məhəlli yerli saat üçün bir təmkin çıxmaq lazım olduğunu göstərməkdədir.
  Yerli vaxt üçün bir təmkin çıxarılmazsa, oruc fasid olar. Kedusinin
  irtifa risaləsinin ön sözündə "Məarif nəzarətinin 1310-cu \[m. 1892\] il
  tarixli 230 saylı qərarı ilə çap edildi" yazılıdır. Bunun üçün Osmanlı
  alimlərinin dövründə, məsələn, Osmanlı alimlərinin ən yüksək məqamı olan
  **"Məşihatı-islamiyyə"**nin hazırladığı 1334-cü \[m. 1916\] il tarixli
  **"İlmiyyə salnaməsi"** adındakı təqvimdə və 1982-ci ilə qədər
  hazırlanan təqvimlərin hamısında və İstanbul üniversiteti Kandilli
  rəsədxanasının 1958-ci il tarixli və 14 saylı **"Əvkatı-şəriyyə"**
  kitabında imsaq vaxtları həqiqi vaxtlardan iki təmkin zamanı əvvəl
  başlamaqdadır. Oruca bu təqvimlərdəki şəri imsaq vaxtından beş dəqiqə
  belə sonra başlayanın orucu səhih olmaz. Şəri zəval vaxtında kölgənin
  boyu həqiqi zəval vaxtındakı feyi zəvaldan daha uzundur. İkisi
  arasındakı fərq təmkin zamanında hasil olan uzunluqdur.

 > Martın 21-i və Sentyabrın 23-ü gecə ilə gündüzün uzunluğu 12 saat olub,
  günəş daima həqiqi zəvaldan altı saat əvvəl tulu və altı saat sonra
  qürub edər. Digər günlərdə gecə ilə gündüzün müddəti bərabər olmadığı
  üçün yay aylarında həqiqi zəval vaxtı ilə həqiqi tulu və həqiqi qürub
  vaxtları arasında 6 saatdan bir miqdar artıq zaman vardır. Qış aylarında
  bu vaxtlar arasında bir miqdar az zaman olur. Altı saat olan bu zaman
  fərqinə **"Nısf fadla"** zamanı deyilir. Yay aylarında həqiqi tulu və
  qürub vaxtları zəval vaxtından 6 ilə Nısf fadlanın cəmi qədər fərqli
  olmaqdadır. Qürub vaxtı zəval vaxtından uzaqlaşdıqda qürubi saatın sübh
  başlanğıcı zəval vaxtına yaxınlaşır. Qürubi saata görə zəval vaxtı yay
  aylarında Nısf fadlanın 6 saat fərqi olur. Hər hansı bir məhəldə:\
  sin Nısf fadla=tan bölgə meridian dərəcəsi x tan meyl\
  bərabərliyindən **"Nısf fadla=yarı fərq"** dərəcəsi tapılır.Bunun dörd
  misli zaman dəqiqəsi olur. Meyl ilə meridian dərəcələrinin işarələri
  eynidirsə, yəni eyni nısf kürədədirlərsə, Nısf fadla zamanının mütləq
  qiyməti 6-ya əlavə edildikdə, həqiqi zamana görə riyadi qürub vaxtı və
  gecə yarısı 12-dən sübh qürubi 12-yə qədər zaman olur. Şəmsin həqiqi
  tulu vaxtı ilə zəvali vaxtı arasında bu qədər zaman vardır. 6-dan
  çıxılsa, qürubi zamana görə riyadi həqiqi zəval vaxtı, yəni sübh 12-dən
  zəval qədər zaman olur ki, eyni zamana görə şəri Namaz vaxtları hesab etmək üçün **"Səadəti-Əbədiyyə"** kitabında
  misallar verilmişdir.
  zöhr vaxtı və həqiqi zamana görə həqiqi tulu vaxtıdır. Tapılan məhəllə
  ilə günəş başqa kürələrdə isə nısf fadlanın mütləq qiyməti 6-ya əlavə
  edildikdə o məhəllin qürubi zamana görə həqiqi zəval vaxtı və həqiqi
  zamana görə həqiqi tulu vaxtı olur. 6-dan çıxıldıqda həqiqi zamana görə
  o məhəldəki riyadi həqiqi qürub vaxtı olur. 1 mayda, məsələn, Privileq
  hesablama cihazında 14.55 ⟶₀,,, tan x 41 tan = arc sin x 4 = ⟶₀,,,
  düymələrinə sıxınca cihazın ekranında Nısf fadla 53 dəqiqə 33 saniyə
  görünür. Həqiqi zamana görə, riyadi həqiqi qürub vaxtı 6 saat 54 dəqiqə,
  məhəlli yerli zamana görə 6 saat 51 dəqiqə və müştərək zamana görə 18
  saat 55 dəqiqədir. Şəri qürub vaxtı 19 saat 5 dəqiqə olur. Qürubi zamana
  görə həqiqi zəval vaxtı 5 saat 6 dəqiqə olur. Bundan İstanbul üçün qürub
  vaxtındakı 10 dəqiqə təmkin zamanı daima çıxarılıb, 4 saat 56 dəqiqə
  azanı zamana görə zəval vaxtı olur. Buna zöhr vaxtlarındakı yenə 10
  dəqiqə təmkin zamanı əlavə etdikdə azanı-saata görə zöhr vaxtı 5 saat 6
  dəqiqə olur. Zöhr vaxtındakı təmkin, qürub vaxtındakı təmkinin eyni
  olduğu üçün qürubi zamana görə həqiqi zəval vaxtı ilə azanı zöhr vaxtı
  eyni olmaqdadır. Əsr və işa azanı vaxtları da belədir. Müştərək saat ilə
  şəri tulu vaxtı 4 saat 57 dəqiqə olur. 5 saat 6 dəqiqə həqiqi gecə
  müddətinin yarısıdır. Həqiqi gecə müddəti olan 10 saat 12 dəqiqədən 2
  təmkin zamanını çıxdıqda azanı zamana görə şəri tulu vaxtı 9 saat 52
  dəqiqə olur. Türkiyənin hər yerində imsaq vaxtından on beş dəqiqə sonra
  sübh namazı qılınır. Yüksək bir yerin D inhitatı-üfüq zaviyəsi:

 > +-----------------------------------------------------------+---------+
  | > Yerin radiusu (metr) 6367654                            | > və ya |
  +===========================================================+=========+
  | > Cos D = =                                               |         |
  | 
                         |         |
  +-----------------------------------------------------------+---------+
  | > Nısf Qutr + yüksəklik 636754+Y                          |         |
  +-----------------------------------------------------------+---------+

  > D \~ 0,03x√Y ilə də dərəcə olaraq tapılır.
  > Y= metr olaraq yüksəklikdir.
  >
  > **"Fadlı-dair saatı",** H, hər yerdə aşağıdakı düsturla tapılır ki,
  > axtarılan vaxt ilə nısf-ün-nəhar

  >arasındakı zamandır. Azanı imsaq vaxtı:\[12 + zöhr -- H -- (1 ÷ 3) =
  saat\] və işa vaxtı \[H -- (12 -- zöhr\] saat olur. Şüa təsiri ilə
  işləyən Privileg hesablama maşınında H :\
  h sin - φ sin x δ sin= ÷ φ cos ÷ δ cos = arc cos ÷ 15 = ⟶₀,,,\
  h = irtifa, φ = enlik, δ = meyl,\
  h irtifa, gecələri və φ ilə δ da cənub yarım kürədə (-) olacaq.

  > Namaz vaxtları da Casio hesablama maşını ilə bu şəkildə müştərək saat
  > olaraq olur: H + S - T = ÷ 15 + 12 - E + N = INV ₀,,,\
  > S=saat başı tul (meridian), T=tədil, N=təmkin,\
  > H,S,T dəyərləri dərəcə; E, N dəyərləri saat olaraq alınacaq.
  >
  > H və N günortadan əvvəl (--), günortadan sonra (+) dır.

  >Təmkin müddəti N, enlik dərəcəsi 44 dərəcədən aşağı və ən yüksək yeri
  500 metrdən az olan yerlər üçün aşağıdakı düymələr ilə saat olaraq
  tapılır. Yəni alətin lövhəsində görülən 0 saat ilə dəqiqə və saniyə
  rəqəmləri təmkin olur:\
  0,03 x Y√ + 1.05 = sin ÷ φ cos ÷ δ cos x 3,82 = INV ₀,,,\
  Batareya ilə işləyən CASİO fx 3600 hesablama maşınında H fadlı-dairi
  tapmaq üçün maşın tərtib edildikdən sonra P¹ itrifa RUN meyl RUN enlik
  RUN düymələri sıxılır. Məsələn; meyl 21º.47\'. 43.5\" isə, meyl üçün 21
  ₀,,, 47 ₀,,, 43,5 ₀,,, düymələri sıxılır. Maşının ekranında həqiqi saat
  görünür. Miqdarlar (-) isə sonra ± düymələri sıxılır. Maşını tərtib
  etmək üçün MODE ⓪ P1 ENT sin x ENT Kin 1 sin x ENT Kin 3 sin = ÷ Kout 1
  cos ÷ Kout 3 cos = INV cos ÷ 15 = INV ₀,,, MODE ⊡ düymələri sıxılır.

  >Bu hesablama maşınları ilə coğrafi enlik və uzunluq dərəcələri verilmiş
  hər hansı bir məhəllin bütün namaz vaxtlarını bir günlük və ya bir illik
  olaraq dərhal cədvəl şəklində əldə etmək mümkündür. Bu cədvəl telefona
  merbut **"Faks"** vasitəsilə dünyanın hər yerindəki bir telefon faksına
  göndərilməkdədir. **"Səadəti əbədiyyə"** 200-cü səhifəyə baxın.

  >Hər hansı bir gündə günəşin meyli və tədili-zaman məlum və coğrafi enlik
  41 dərəcə olan yerlərdə nısf fadla və fadlı-dair və namaz vaxtları heç
  bir hesaba, düstura və hesab maşını istifadə etməyə lüzum olmadan
  **"Rubı-dairə"** ilə asan şəkildə və sürətlə məlum olur. Rubı-dairə və
  bundan istifadə şəkli Həqiqət kitabevi tərəfindən çap edilir və yayılır.

  >İbadətlərin vaxtlarını təyin və təsbit etmək, yəni anlayıb başa salmaq
  din bilgisi ilə olur. İbadətlərin vaxtlarını din alimləri, yəni
  müctəhidlər anlamış və bildirmişdir. Fiqh alimləri müctəhidlərin
  bildirdiklərini **"Fiqh"** kitablarında yazmışdırlar. Bildirmiş olan
  vaxtları hesab etmək isə astronomiyanı bilən müsəlmanların vəzifəsidir.
  Hesab edilməsi caiz olan vaxtları astronomiya alimləri tapır. Onların
  tapdığını din alimlərinin təsdiq etmələri şərtdir. Namaz vaxtlarını
  saatla və qibləni kompasla anlamağın caiz olduğu **"İbni Abidin"**də
  "Namazda qibləyə dönmək" bəhsində və **"Fətafayi-Şəmsüddin Rəmli"**də
  yazılıdır. **"Mevduat-ul-ulum"**da deyilir ki, "Dövrümüzdə namaz
  vaxtlarını hesab etmək fərzi-kifayədir. Müsəlmanların günəşin
  hərəkətindən və ya təqvimlərdən anlamaları fərzdir".

  > İbni Abidin və Şafii **"Əl-ənvər"** və maliki **"Əl-müqaddəmət-ülizziyyə"** şərhində deyir ki, "Namazın
  səhih olması üçün vaxtı girdikdən sonra qılınması və vaxtında qıldığını
  bilinməsi şərtdir. Vaxtın girdiyində şübhəli olaraq qılıb, sonra
  vaxtında qılmış olduğunu anlayarsa, bu namazı səhih olmaz. Vaxtın
  bilinməsi, namaz vaxtlarını bilən adil bir müsəlmanın oxuduğu şəri azanı
  eşitməklə olur. Azanı oxuyan adil deyildirsə, \[və ya adil müsəlmanın
  hazırladığı təqvim yoxdursa\] hər kəs özü vaxtın girdiyini araşdırıb,
  qüvvətli zənn etdikdə qılmalıdır. Fasiqin və ya adil olduğu bilinməyən
  şəxsin qibləni göstərməsi təmiz, nəcis, halal, haram deyilməsi kimi
  dindən olan xəbərləri də azan oxuması kimi olub ona deyil, hər kəs özü
  araşdırıb, anladığı ilə hərəkət etməlidir. Tək qılanların, xəstələrin,
  yolçuların, işə başı qarışıb, namazı qaçırmaq qorxusu olanların hər
  namazı vaxtının əvvəlində qılmaları lazımdır. Sübh namazını vaxtının
  sonunda qılmaq hənəfi məzhəbində əfdaldır.

  >Sübh namazının və orucun əvvəl vaxtı fəcri-sadiq vaxtı ilə başlayır. Bu
  vaxt qürub vaxtında 12-dən başlayan azanı saatın fəcr vaxtına
  gəlməsindən məlum olur. Yaxud gecə yarısı 12-dən başlayan saatın fəcr
  vaxtına gəlməsindən məlum olur.

  >Şəmsin tulusu, gecə yarısı 12-dən gecə müddətinin yarısı sonra qürub
  vaxtındakı 12-dən gecə müddəti qədər sonra və ya zəvaldan gündüz
  müddətinin yarısı qədər əvvəl başlayar. Sübh qürubi saatın 12 vaxtı
  qürub vaxtındakı 12-dən 12 saat sonra və gecə yarısı 12-dən gündüz
  müddətinin yarısı qədər sonra və ya həqiqi zəval vaxtından gecə yarısı
  müddətinin yarısı qədər əvvəldir.

  > Tulu vaxtı ilə sübhün 12 vaxtı arasında gecə və gündüz uzunluqlarının yarıları arasındakı fərq qədər zaman vardır.

  >Camaat ilə zöhr namazını yayın istilərində gec, qış aylarında isə erkən
  qılmaq müstəhəbdir. Şam namazını hər zaman erkən qılmaq müstəhəbdir.
  İşanı şəri gecənin üçdə biri olana qədər gec qılmaq müstəhəbdir. Gecənin
  yarısından sonraya təxir etmək tahrimən məkruhdur. Bu gecikmələr
  camaatla qılanlar üçündür. Evində tək qılan hər namazı vaxtı girən kimi
  qılmalıdır. **"Künuz-üd-dəqaiq"**də yazılı, Hakimin və Tirmüzinin
  bildirdikləri hədisi-şərifdə, **"İbadətlərin ən qiymətlisi əvvəl
  vaxtında qılınan namazdır"** buyuruldu. **"İzalət-ül hafa"**nın 537-ci
  səhifəsində yazılı **"Müslim"** kitabındakı hədisi-şərifdə, **"Bir zaman
  gələcək amirlər, imamlar namazı öldürəcəklər,** \[namazın ədasını\]
  **vaxtından sonraya saxlayacaqlar. Sən namazını vaxtında qıl! Səndən
  sonra camaat olarsa, onlarla da təkrar qıl! İkinci qıldığın nafilə
  olar"** buyuruldu. Əsri və işanı İmamı-azamın qövlünə görə qılmaq
  ehtiyatlı olar. Oyana bilməyən vitr namazını işadan dərhal sonra
  qılmalıdır. İşadan əvvəl qılarsa sonra təkrar qılar. Oyana bilən isə+
  gecənin sonunda qılmalıdır.

  > Bir bölgədə bir namaz vaxtı məhəlli və ya müştərək yerli vaxta görə məlum ikən bu namazın azanı
  vaxta görə vaxtını tapmaq üçün bu iki düsturdan istifadə etmək lazımdır:

  > **Müştərək zamana görə vaxt = Azanı zamana görə vaxt + Müştərək zamana görə şəri qürub vaxtı.**

  >**Azanı zaman görə vaxt = Müştərək zamana görə vaxt -- Müştərək zamana
  görə şəri qürub vaxtı.** Qürubdan əvvəlki zamanlarda çıxma əməli etmək
  üçün əvvəlcə 12 əlavə edilir. Əhməd Ziya bəyin kitabında qürub vaxtı
  yerinə zəval vaxtı düsturu istifadə olunur.

  > Bu ikinci düstur hər hansı bir vaxtda azanı saatı ayarlamaq üçün də istifadə olunur.
  

  >Maliki və şafii məzhəblərində zöhrlə əsr və şamla işa namazları cəm
  edilə bilər. Bu iki namazdan biri ikincisinin vaxtında qılına bilər."""
  ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      appBar: AppBar(
        centerTitle: true,

        title: Text("Vaxtların Hesablanması" , style: TextStyle(fontFamily: "Oswald"),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: Scrollbar(
        child: Markdown(
          data: _markdownData,
          selectable: true,
          imageDirectory: "assets/",


        ),
      ),

    );
  }
}


//![Alt text](resource:assets/image1.png )
