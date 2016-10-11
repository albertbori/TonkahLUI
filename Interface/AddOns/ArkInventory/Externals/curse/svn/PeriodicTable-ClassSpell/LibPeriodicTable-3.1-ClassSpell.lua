-- (c) 2007 Nymbia.  see LGPLv2.1.txt for full details.
--DO NOT MAKE CHANGES TO THIS FILE BEFORE READING THE WIKI PAGE REGARDING CHANGING THESE FILES
if not LibStub("LibPeriodicTable-3.1", true) then error("PT3 must be loaded before data") end
LibStub("LibPeriodicTable-3.1"):AddData("ClassSpell", gsub("$Rev: 521 $", "(%d+)", function(n) return n+90000 end), {
	["ClassSpell.Death Knight.General"]="-190780:0,-205224:1,-82246:1,-86524:50,-55095:55,-55078:55,-53428:55,-53343:55,-50977:55,-50842:55,-49576:55,-48266:55,-47541:55,-45477:55,-45462:55,-49998:56,-54447:57,-53342:57,-48263:57,-47528:57,-47476:58,-45524:58,-178819:60,-53331:60,-43265:60,-51986:61,-48792:62,-48265:64,-57330:65,-3714:66,-48707:68,-111673:69,-53344:70,-62158:72,-61999:72,-47568:76,-42650:80,-77575:81,-77606:85,-130736:87",
	["ClassSpell.Death Knight.Talent"]="-195679:56,-194916:56,-194878:56,-161497:56,-123693:56,-115989:56,-194918:57,-194917:57,-194909:57,-194662:57,-114556:57,-51052:57,-49039:57,-205727:58,-108194:58,-96268:58,-50041:58,-205723:60,-81229:60,-51462:60,-45529:60,-119975:75,-108196:75,-48743:75,-198943:90,-194912:90,-194679:90,-108201:90,-108200:90,-108199:90,-194913:100,-194844:100,-152281:100,-152280:100,-152279:100",
	["ClassSpell.Death Knight.Blood"]="-1000146:0,-161608:10,-158298:10,-81136:10,-49509:10,-195182:55,-86537:55,-50371:55,-50034:55,-50029:55,-195292:58,-56222:58,-48982:64,-81164:70,-81127:72,-49028:74,-161797:76,-55233:76,-49222:78,-155522:80,-77513:80,-114866:87,-165394:90,-48982:20,-49005:30,-49016:40,-55233:45,-55050:50,-49028:60",
	["ClassSpell.Death Knight.Frost"]="-674:0,-59057:10,-195621:55,-86113:55,-54637:55,-50887:55,-49184:55,-49143:55,-196770:57,-49020:58,-55610:60,-51128:63,-50385:65,-51271:68,-81333:74,-66192:74,-77514:80,-130735:87,-49039:20,-49796:30,-49203:40,-51271:45,-49143:50,-49184:60",
	["ClassSpell.Death Knight.Unholy"]="-197147:1,-56835:10,-51160:10,-91107:55,-86536:55,-46584:56,-55090:58,-55610:60,-49572:60,-85948:62,-49530:64,-63560:70,-49206:74,-50392:75,-77515:80,-165395:90,-49158:20,-51052:40,-63560:40,-49222:45,-55090:50,-49206:60",
	["ClassSpell.Druid.General"]="-202771:0,-202768:0,-5176:1,-8921:3,-774:4,-125972:6,-22568:6,-5221:6,-5215:6,-768:6,-33917:8,-6795:8,-5487:8,-16870:10,-339:10,-50769:12,-193753:14,-106832:14,-18960:14,-783:16,-164815:18,-1850:24,-5185:26,-106830:28,-77758:28,-16961:30,-5225:36,-20484:56,-165962:58,-2908:60,-1126:62,-22842:68,-33786:78,-106898:84",
	["ClassSpell.Druid.Talent"]="-205636:15,-203962:15,-203953:15,-202425:15,-202345:15,-202022:15,-202021:15,-200383:15,-131768:15,-102401:15,-102280:15,-204012:30,-145108:30,-108238:30,-102351:30,-202157:45,-202155:45,-197632:45,-197492:45,-197491:45,-197490:45,-197488:45,-132469:45,-106707:45,-102359:45,-158478:60,-158477:60,-158476:60,-114107:60,-102706:60,-102703:60,-102693:60,-102560:60,-102558:60,-102543:60,-33891:60,-33831:60,-203964:75,-202347:75,-200390:75,-102793:75,-5211:75,-99:75,-203974:90,-203965:90,-202360:90,-202359:90,-202342:90,-202060:90,-202032:90,-202031:90,-197073:90,-158504:90,-158501:90,-158497:90,-124974:90,-108373:90,-108294:90,-108293:90,-108292:90,-108291:90,-204066:100,-204053:100,-202770:100,-202430:100,-202354:100,-202028:100,-197721:100,-197061:100,-171746:100,-155835:100,-155834:100,-155675:100,-155672:100,-155580:100,-155578:100,-155577:100,-152222:100,-152221:100,-152220:100,-80313:100",
	["ClassSpell.Druid.Balance"]="-166163:0,-137013:0,-197524:10,-190984:10,-112857:10,-108299:10,-2912:10,-194153:12,-78674:12,-24858:16,-127663:20,-2782:22,-93399:26,-78675:28,-179333:38,-191034:40,-22812:44,-86104:50,-194223:64,-112071:68,-48505:76,-77492:80,-33605:82,-88747:84,-165386:90,-5570:30,-33831:50,-50516:50,-48505:60",
	["ClassSpell.Druid.Feral"]="-137011:0,-197692:1,-166142:1,-157447:1,-1822:6,-33873:10,-5217:10,-52610:18,-1079:20,-106785:22,-2782:22,-16974:26,-770:28,-16864:38,-48484:40,-17007:46,-106952:48,-86097:50,-61336:56,-106839:64,-77493:80,-22570:82,-165372:90",
	["ClassSpell.Druid.Guardian"]="-137010:0,-166142:1,-157447:1,-161608:10,-158298:10,-62606:10,-33873:10,-16931:10,-6807:10,-2782:22,-770:28,-135288:32,-33745:38,-48484:40,-192081:44,-22812:44,-106952:48,-86096:50,-61336:56,-106839:64,-192083:72,-155783:80,-165387:90,-159232:90",
	["ClassSpell.Druid.Restoration"]="-137012:0,-112857:10,-108299:10,-92364:10,-18562:10,-17073:10,-85101:14,-8936:18,-88423:22,-48500:28,-132158:30,-33763:36,-113043:38,-22812:44,-86093:50,-102342:64,-740:74,-48438:76,-77495:80,-145205:84,-145518:88,-165374:90,-17116:30,-18562:40,-48438:60",
	["ClassSpell.Hunter.General"]="-205154:0,-203413:0,-138430:0,-157443:1,-3044:1,-982:1,-883:1,-136:1,-56641:3,-19885:4,-19884:4,-19883:4,-19882:4,-19880:4,-19879:4,-19878:4,-1494:4,-186257:5,-5116:8,-93322:10,-93321:10,-83242:10,-2641:10,-1515:10,-1462:10,-6991:11,-781:14,-6197:16,-147362:22,-5118:24,-2643:24,-1499:28,-5384:32,-19801:35,-13813:38,-1543:38,-19506:39,-8737:40,-83243:42,-34477:42,-13809:46,-77769:48,-186265:50,-20736:52,-13159:56,-83244:62,-53271:74,-19263:78,-83245:82,-51753:85",
	["ClassSpell.Hunter.Talent"]="-204315:15,-204308:15,-201082:15,-200163:15,-194397:15,-193533:15,-193532:15,-118675:15,-109298:15,-109215:15,-201078:30,-201075:30,-199530:30,-199527:30,-194599:30,-194595:30,-109248:30,-19577:30,-19386:30,-199921:45,-199523:45,-109304:45,-109260:45,-109212:45,-199528:60,-199518:60,-194306:60,-194277:60,-177667:60,-120679:60,-109306:60,-200108:75,-199483:75,-191241:75,-131894:75,-130392:75,-121818:75,-194855:90,-194386:90,-120360:90,-117050:90,-109259:90,-201430:100,-199543:100,-199532:100,-199522:100,-198670:100,-194407:100,-191384:100,-163485:100,-162534:100,-155228:100,-152245:100,-152244:100",
	["ClassSpell.Hunter.Beast Mastery"]="-193455:1,-53270:10,-34026:10,-193530:18,-34954:20,-185789:22,-115939:24,-19623:30,-82692:32,-53351:35,-19574:40,-53260:43,-56315:58,-53253:63,-76657:80,-77767:81,-165389:90",
	["ClassSpell.Hunter.Marksmanship"]="-185358:10,-19434:10,-185987:18,-185901:18,-34483:20,-186387:22,-194291:26,-53351:35,-193526:40,-35110:45,-3045:54,-53209:60,-193468:78,-76659:80,-165378:90",
	["ClassSpell.Hunter.Survival"]="-202800:10,-195645:10,-186270:10,-164856:10,-63458:10,-53301:10,-190928:18,-193265:19,-190925:22,-187707:24,-185855:26,-187650:28,-187698:42,-186289:44,-191433:48,-3674:50,-187708:54,-19387:55,-87935:68,-191334:78,-76658:80,-77767:81,-165396:90",
	["ClassSpell.Mage.General"]="-44614:1,-122:3,-2136:5,-1953:7,-2139:8,-193759:14,-118:14,-45438:15,-49359:17,-32272:17,-32271:17,-3567:17,-3566:17,-3565:17,-3563:17,-3562:17,-3561:17,-190336:22,-120:28,-475:29,-130:32,-42955:38,-49360:42,-32267:42,-32266:42,-11420:42,-11419:42,-11418:42,-11417:42,-11416:42,-10059:42,-49361:52,-49358:52,-66:56,-1459:58,-161372:60,-161355:60,-161354:60,-161353:60,-126819:60,-61780:60,-61721:60,-61305:60,-28272:60,-28271:60,-35715:62,-33690:62,-30449:64,-35717:66,-33691:66,-120145:71,-53140:71,-43987:72,-120146:74,-117957:74,-53142:74,-61316:80,-80353:84,-88346:85,-88345:85,-88344:85,-88342:85,-132627:90,-132626:90,-132621:90,-132620:90,-176248:92,-176246:92,-176244:92,-176242:92",
	["ClassSpell.Mage.Talent"]="-205035:15,-205027:15,-205026:15,-205025:15,-205024:15,-205023:15,-205022:15,-205021:15,-205020:15,-157913:15,-108843:15,-108839:15,-140468:30,-108978:30,-11426:30,-113724:45,-111264:45,-102051:45,-205033:60,-205032:60,-205030:60,-205029:60,-205028:60,-110959:60,-86949:60,-11958:60,-205036:75,-157997:75,-157981:75,-157980:75,-157976:75,-114923:75,-112948:75,-44457:75,-205039:90,-205038:90,-205037:90,-116011:90,-55342:90,-1463:90,-199786:100,-198929:100,-198923:100,-155149:100,-155148:100,-155147:100,-153626:100,-153595:100,-153561:100,-152087:100",
	["ClassSpell.Mage.Arcane"]="-190427:0,-114664:10,-30451:10,-44425:12,-1449:18,-12043:22,-195676:24,-5143:24,-31589:36,-12051:40,-12042:62,-190740:78,-76547:80,-6117:80,-165359:90",
	["ClassSpell.Mage.Fire"]="-11366:10,-195283:12,-133:12,-2948:22,-108853:24,-190319:28,-30482:34,-117216:36,-2120:44,-31661:62,-12846:80,-11129:80,-165357:90",
	["ClassSpell.Mage.Frost"]="-31687:10,-116:12,-12982:16,-30455:22,-112965:24,-190447:28,-12472:36,-190356:44,-10:52,-7302:54,-84714:62,-44572:66,-44549:77,-76613:80,-165360:90,-12472:20,-11958:30,-11426:40,-31687:50,-44572:60",
	["ClassSpell.Monk.General"]="-205414:0,-120277:0,-115074:0,-116812:1,-103985:1,-100780:1,-100787:3,-109132:5,-100784:7,-120272:10,-116694:12,-115546:14,-115178:18,-126892:20,-115450:20,-115080:22,-115203:24,-115072:26,-137562:30,-126895:30,-116705:32,-115078:44,-101546:46,-117952:54,-119996:87,-101643:87",
	["ClassSpell.Monk.Talent"]="-197945:15,-196607:15,-116841:15,-115174:15,-115173:15,-124081:30,-123986:30,-115098:30,-197915:45,-197900:45,-196721:45,-196719:45,-121817:45,-115399:45,-115396:45,-198898:60,-196722:60,-119392:60,-119381:60,-116844:60,-122783:75,-122280:75,-122278:75,-198664:90,-196740:90,-196730:90,-196725:90,-123904:90,-116847:90,-115008:90,-197908:100,-197895:100,-196743:100,-196738:100,-196737:100,-196736:100,-173841:100,-157676:100,-157675:100,-157535:100,-157533:100,-152175:100,-152174:100,-152173:100",
	["ClassSpell.Monk.Brewmaster"]="-157445:1,-205523:3,-161608:10,-158298:10,-124146:10,-117967:10,-115180:10,-115069:10,-121253:11,-115181:18,-115295:26,-128938:36,-115308:36,-126060:45,-120225:50,-124502:56,-115315:70,-119582:75,-117906:80,-116781:81,-115176:82,-165379:90",
	["ClassSpell.Monk.Mistweaver"]="-193884:10,-154436:10,-139598:10,-121278:10,-116645:10,-115175:10,-115070:10,-124682:16,-115451:20,-115921:22,-115151:24,-154555:45,-120224:50,-116849:50,-123766:56,-115294:56,-107428:56,-191837:58,-116670:62,-115460:64,-116680:66,-115313:70,-115310:78,-117907:80,-165397:90",
	["ClassSpell.Monk.Windwalker"]="-137025:0,-157445:1,-137384:10,-124146:10,-113656:10,-101545:18,-128595:20,-122470:22,-116092:26,-116095:28,-115288:36,-120227:50,-123980:56,-116740:56,-107428:56,-137639:75,-166916:80,-115636:80,-116781:81,-115176:82,-165398:90",
	["ClassSpell.Paladin.General"]="-200654:0,-123830:1,-82242:1,-35395:1,-105361:3,-20271:5,-853:7,-136494:9,-130552:9,-85673:9,-25780:12,-7328:13,-62124:15,-633:16,-642:18,-73629:20,-69820:20,-34769:20,-13819:20,-4987:20,-498:26,-20217:30,-20165:32,-96231:36,-24275:38,-73630:40,-69826:40,-34767:40,-23214:40,-32223:44,-10326:46,-1022:48,-1044:52,-25956:58,-6940:80,-19740:81,-115675:85",
	["ClassSpell.Paladin.Talent"]="-205228:15,-204019:15,-203785:15,-198038:15,-196926:15,-87172:15,-85499:15,-26023:15,-204035:30,-204023:30,-203776:30,-203316:30,-115750:30,-105593:30,-20066:30,-198054:45,-148039:45,-114163:45,-85804:45,-20925:45,-204018:60,-204013:60,-203797:60,-202271:60,-202270:60,-198034:60,-183425:60,-183416:60,-183415:60,-114154:60,-114039:60,-105622:60,-205191:75,-204139:75,-204077:75,-197646:75,-171648:75,-105809:75,-86172:75,-53376:75,-205656:90,-204150:90,-204054:90,-202273:90,-196923:90,-183778:90,-114165:90,-114158:90,-114157:90,-204074:100,-203791:100,-200025:100,-197446:100,-157048:100,-157047:100,-157007:100,-156910:100,-152263:100,-152262:100,-152261:100",
	["ClassSpell.Paladin.Holy"]="-112859:10,-20473:10,-19750:14,-53551:20,-2812:20,-82327:28,-31868:34,-53563:39,-183998:42,-86103:50,-53576:50,-82326:54,-88821:56,-31821:60,-85222:70,-31842:72,-183997:78,-76669:80,-165380:90",
	["ClassSpell.Paladin.Protection"]=",-64205:20",
	["ClassSpell.Paladin.Retribution"]="-1000112:0,-85256:10,-53503:10,-19750:14,-184575:16,-53595:20,-184662:24,-31801:24,-183218:26,-53385:34,-31868:34,-203528:42,-20154:42,-203538:44,-203539:46,-879:46,-86539:50,-121783:54,-183435:56,-20164:70,-31884:72,-167187:80,-140333:80,-76672:80,-165381:90",
	["ClassSpell.Priest.General"]="-585:1,-589:3,-81782:5,-17:5,-2061:7,-2006:18,-88684:20,-21562:22,-586:24,-528:26,-48045:28,-9484:32,-1706:34,-34433:42,-2096:42,-6346:54,-33076:68,-32375:72,-73325:84",
	["ClassSpell.Priest.Talent"]="-205351:15,-200347:15,-200153:15,-200128:15,-193195:15,-193155:15,-193134:15,-112833:15,-108945:15,-19236:15,-193173:30,-193063:30,-121536:30,-108942:30,-64129:30,-205369:45,-205367:45,-204263:45,-200199:45,-196707:45,-196704:45,-162448:45,-139139:45,-129250:45,-123040:45,-109186:45,-205371:60,-200209:60,-199853:60,-199849:60,-197045:60,-196985:60,-108920:60,-8122:60,-605:60,-199855:75,-197419:75,-197034:75,-162452:75,-109964:75,-109175:75,-109142:75,-10060:75,-205385:90,-200174:90,-197031:90,-127632:90,-122121:90,-121135:90,-120644:90,-120517:90,-110744:90,-204883:100,-204197:100,-204065:100,-200309:100,-200183:100,-193225:100,-193223:100,-193157:100,-155361:100,-155271:100,-155246:100,-155245:100,-152118:100,-152117:100,-152116:100",
	["ClassSpell.Priest.Discipline"]="-186440:1,-200829:7,-95860:10,-87336:10,-52798:10,-47540:10,-47536:10,-47517:10,-186263:18,-14914:18,-132157:20,-527:22,-47515:24,-45243:30,-2060:34,-81749:38,-81662:44,-194509:46,-596:46,-81700:50,-15487:52,-33206:58,-62618:70,-77484:80,-165376:90",
	["ClassSpell.Priest.Holy"]="-95861:10,-88625:10,-87336:10,-14914:18,-527:22,-139:26,-45243:30,-20711:30,-63733:34,-2060:34,-126135:36,-596:46,-32546:48,-34861:50,-81209:56,-81208:56,-81206:56,-95649:64,-47788:70,-64843:78,-77485:80,-165362:90",
	["ClassSpell.Priest.Shadow"]="-186440:1,-185916:10,-15407:10,-186263:18,-95740:21,-8092:21,-2944:21,-15473:24,-49868:26,-190719:28,-34914:28,-78203:42,-73510:44,-32379:46,-15487:52,-47585:60,-64044:74,-15286:78,-77486:80,-165370:90",
	["ClassSpell.Rogue.General"]="-192760:0,-157442:1,-121733:1,-82245:1,-1752:1,-2098:3,-1784:5,-8676:6,-5277:8,-2823:10,-6770:12,-185311:14,-5171:14,-921:15,-73651:16,-1766:18,-3408:20,-1776:22,-1804:24,-2983:26,-1725:28,-113742:30,-8679:30,-1833:30,-1856:34,-2094:38,-408:40,-2836:42,-1966:44,-1860:48,-703:48,-31224:58,-31209:62,-14185:68,-5938:74,-114018:76,-57934:78,-121411:83,-76577:85",
	["ClassSpell.Rogue.Talent"]="-200758:15,-200733:15,-196938:15,-196937:15,-196864:15,-193640:15,-193537:15,-108209:15,-108208:15,-14062:15,-196924:30,-196922:30,-195457:30,-108210:30,-74001:30,-26679:30,-193531:45,-108211:45,-79008:45,-31230:45,-200759:60,-193546:60,-138106:60,-108212:60,-36554:60,-200778:75,-199743:75,-196951:75,-196861:75,-154904:75,-131511:75,-108216:75,-206237:90,-200806:90,-200802:90,-196979:90,-193539:90,-185767:90,-137619:90,-114015:90,-114014:90,-196976:100,-152152:100,-152151:100,-152150:100",
	["ClassSpell.Rogue.Assassination"]="-185565:10,-84601:10,-14117:10,-1329:10,-51667:20,-32645:20,-14190:30,-121152:40,-111240:40,-79134:46,-1943:46,-58423:54,-51723:66,-79140:80,-76803:80,-165390:90",
	["ClassSpell.Rogue.Combat"]="-199736:1,-199754:10,-193315:10,-61329:10,-13877:10,-185763:11,-84617:20,-199804:25,-35551:30,-14161:32,-193316:36,-13750:40,-199740:54,-84654:60,-76806:80,-51690:80,-51690:60",
	["ClassSpell.Rogue.Subtlety"]="-196819:10,-91023:10,-79152:10,-31223:10,-31220:10,-16511:10,-185438:22,-196912:27,-14183:30,-185313:36,-53:40,-185314:42,-195452:46,-1943:46,-51701:50,-58423:54,-79147:60,-197835:66,-51723:66,-76808:80,-51713:80",
	["ClassSpell.Shaman.General"]="-403:1,-73899:3,-8004:7,-324:8,-8050:12,-370:12,-2008:14,-2645:15,-57994:16,-3599:16,-51886:18,-8056:22,-546:24,-2484:26,-421:28,-36936:30,-5394:30,-20608:32,-556:34,-6196:36,-8177:38,-8737:40,-86529:50,-8143:54,-2062:58,-73920:60,-108269:63,-2894:66,-32182:70,-2825:70,-51514:75,-116956:80",
	["ClassSpell.Shaman.Talent"]="-201909:15,-201900:15,-201898:15,-201897:15,-200072:15,-200071:15,-108271:15,-108270:15,-30884:15,-196884:30,-192088:30,-192077:30,-192063:30,-108273:30,-63374:30,-51485:30,-196932:45,-192058:45,-108287:45,-108285:45,-108284:45,-200076:60,-197464:60,-192106:60,-192087:60,-108283:60,-16188:60,-16166:60,-198838:75,-192235:75,-192234:75,-147074:75,-108282:75,-108281:75,-197467:90,-197214:90,-197211:90,-192249:90,-192246:90,-165479:90,-165477:90,-117014:90,-117013:90,-117012:90,-197995:100,-197992:100,-192222:100,-188089:100,-157154:100,-157153:100,-152257:100,-152256:100,-152255:100",
	["ClassSpell.Shaman.Elemental"]="-190493:1,-188196:1,-190488:3,-188389:5,-8042:6,-123099:10,-62099:10,-60188:10,-51490:10,-29000:10,-88766:20,-196840:26,-188443:28,-51505:34,-198067:48,-86108:50,-77756:50,-61882:60,-30823:65,-198103:72,-168534:78,-170374:80,-165462:81,-79206:85,-114050:87,-165399:90",
	["ClassSpell.Shaman.Enhancement"]="-190899:0,-187837:1,-157444:1,-188070:7,-193786:10,-86629:10,-60103:10,-51522:10,-30814:10,-10400:10,-193796:12,-196834:19,-16282:20,-17364:26,-187874:28,-166221:30,-33757:30,-8190:36,-195255:38,-201845:40,-1535:44,-86099:50,-51530:50,-187880:52,-58875:60,-51533:60,-30823:65,-77223:80,-73680:81,-114051:87,-165368:90",
	["ClassSpell.Shaman.Restoration"]="-188838:3,-112858:10,-95862:10,-61295:10,-16213:10,-77130:18,-52127:20,-974:26,-51505:34,-16196:40,-1064:44,-86100:50,-51564:50,-77472:60,-108280:65,-98008:70,-77226:80,-79206:85,-114052:87,-165391:90",
	["ClassSpell.Warlock.General"]="-187394:0,-196657:1,-688:1,-686:1,-172:3,-697:8,-6201:9,-93375:10,-5782:14,-20707:18,-5784:20,-712:20,-126:22,-5697:24,-101976:27,-691:29,-1098:31,-710:32,-23161:40,-698:42,-1122:49,-119898:56,-18540:58,-104773:64,-29858:66,-29893:68,-48020:76,-48018:76,-166928:80,-109773:82,-111771:87",
	["ClassSpell.Warlock.Talent"]="-205184:15,-205181:15,-205145:15,-198590:15,-196406:15,-196269:15,-196102:15,-174848:15,-108371:15,-108370:15,-108359:15,-205148:30,-196277:30,-196272:30,-196270:30,-196105:30,-196104:30,-196103:30,-30283:30,-6789:30,-5484:30,-110913:45,-108416:45,-108415:45,-196605:60,-196412:60,-196408:60,-196283:60,-196226:60,-196098:60,-111400:60,-111397:60,-108482:60,-171975:75,-108503:75,-108501:75,-108499:75,-137587:90,-108508:90,-108505:90,-205180:100,-205179:100,-205178:100,-196447:100,-196410:100,-157696:100,-157695:100,-152109:100,-152108:100,-152107:100",
	["ClassSpell.Warlock.Affliction"]="-689:7,-108558:10,-30108:10,-755:11,-205183:12,-1454:16,-117198:19,-74434:19,-27243:21,-103103:24,-980:36,-48181:60,-86121:79,-77215:80,-113860:84,-165367:90",
	["ClassSpell.Warlock.Demonology"]="-689:7,-124913:10,-122351:10,-108869:10,-104315:10,-103958:10,-755:11,-193396:12,-109151:12,-6353:13,-1454:16,-105174:19,-1949:22,-114592:32,-193440:36,-30146:42,-77219:80,-113861:84,-165392:90",
	["ClassSpell.Warlock.Destruction"]="-193541:0,-116858:10,-111546:10,-108647:10,-29722:10,-17962:10,-348:12,-114635:15,-5740:21,-80240:36,-17877:47,-109784:54,-108683:54,-117896:69,-120451:79,-77220:80,-113858:84,-165363:90",
	["ClassSpell.Warrior.General"]="-203526:0,-203178:0,-123829:1,-88163:1,-3127:1,-2457:1,-78:1,-100:3,-34428:5,-71:9,-355:12,-158836:15,-156321:18,-57755:22,-6552:24,-205547:28,-205546:28,-115767:32,-1715:36,-6673:42,-5246:52,-18499:54,-23920:66,-469:68,-3411:72,-64382:74,-6544:85",
	["ClassSpell.Warrior.Talent"]="-202297:15,-202296:15,-202161:15,-103828:15,-103827:15,-103826:15,-205484:30,-103840:30,-55694:30,-29838:30,-202316:45,-202288:45,-169685:45,-169683:45,-169680:45,-169679:45,-56636:45,-29725:45,-1464:45,-203201:60,-202224:60,-202163:60,-197690:60,-118000:60,-107570:60,-46968:60,-202922:75,-202593:75,-202561:75,-202560:75,-202095:75,-114030:75,-114029:75,-114028:75,-202743:90,-202612:90,-202603:90,-202572:90,-107574:90,-46924:90,-12292:90,-203179:100,-203177:100,-202751:100,-176289:100,-152278:100,-152277:100,-152276:100",
	["ClassSpell.Warrior.Arms"]="-163201:7,-772:7,-12712:10,-12294:10,-6343:14,-184783:18,-1680:26,-86101:50,-118038:56,-12328:60,-167188:80,-76838:80,-174926:81,-167105:81,-97462:83,-1719:87,-165365:90",
	["ClassSpell.Warrior.Fury"]="-5308:7,-184361:10,-46917:10,-46915:10,-23881:10,-23588:10,-184364:12,-13046:14,-184367:18,-100130:18,-12323:19,-1680:26,-190411:28,-85288:30,-81099:38,-86110:50,-118038:56,-12950:58,-167188:80,-76856:80,-174926:81,-97462:83,-1719:87,-165383:90",
	["ClassSpell.Warrior.Protection"]="-5308:7,-161608:10,-158298:10,-122509:10,-46953:10,-29144:10,-23922:10,-13046:14,-6343:14,-2565:18,-20243:26,-6572:30,-190456:34,-12975:38,-871:48,-86535:50,-204488:52,-1160:56,-84608:60,-198304:72,-161798:76,-76857:80,-114192:87,-165393:90,-159362:90",
})
