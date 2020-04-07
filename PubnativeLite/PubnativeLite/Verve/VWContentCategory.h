//
//  VWContentCategory.h
//  HyBid
//
//  Created by Fares Ben Hamouda on 07.04.20.
//  Copyright © 2020 Can Soykarafakili. All rights reserved.
//

/*
 *
 * VWContentCategory.h
 *
 * Content categories.
 *
 * Categorizations are sourced from the Interactive Advertising Bureau, http://www.iab.net
 *
 * If using the Verve Content API, categorizations will ordinarily be provided for you in
 * the conetn hierarchy response.  Otherwise, you should choose as specific a category as
 * possible for the context in which the ad is being displayed.
 *
 * Copyright © 2019 Verve Wireless, Inc. All rights reserved.
 *
 */

#ifndef VWAdLibrary_VWContentCategory_h
#define VWAdLibrary_VWContentCategory_h

typedef NS_ENUM(NSInteger, VWContentCategory) {
  /* Verve-specific. */
  VWContentCategoryIndex = 137,
  VWContentCategoryHomePage = 888,
  
  /* Arts and Entertainment */
  VWContentCategoryArtsAndEntertainment = 24,
  VWContentCategoryArtsAndEntertainmentBooksAndLiterature = 1000,
  VWContentCategoryArtsAndEntertainmentCelebrityFanGossip = 1001,
  VWContentCategoryArtsAndEntertainmentFineArt = 1002,
  VWContentCategoryArtsAndEntertainmentHumor = 1003,
  VWContentCategoryArtsAndEntertainmentMusic = 1004,
  VWContentCategoryArtsAndEntertainmentTelevision = 32,
  
  /* Automotive */
  VWContentCategoryAutomotive = 1,
  VWContentCategoryAutomotiveAutoParts = 1005,
  VWContentCategoryAutomotiveAutoRepair = 1006,
  VWContentCategoryAutomotiveBuyingSellingCars = 1007,
  VWContentCategoryAutomotiveCarCulture = 1008,
  VWContentCategoryAutomotiveCertifiedPreOwned = 1009,
  VWContentCategoryAutomotiveConvertible = 1010,
  VWContentCategoryAutomotiveCoupe = 1011,
  VWContentCategoryAutomotiveCrossover = 1012,
  VWContentCategoryAutomotiveDiesel = 1013,
  VWContentCategoryAutomotiveElectricVehicle = 1014,
  VWContentCategoryAutomotiveHatchback = 1015,
  VWContentCategoryAutomotiveHybrid = 1016,
  VWContentCategoryAutomotiveLuxury = 1017,
  VWContentCategoryAutomotiveMiniVan = 1018,
  VWContentCategoryAutomotiveMotorcycles = 1019,
  VWContentCategoryAutomotiveOffRoadVehicles = 1020,
  VWContentCategoryAutomotivePerformanceVehicles = 1021,
  VWContentCategoryAutomotivePickup = 1022,
  VWContentCategoryAutomotiveRoadSideAssistance = 1023,
  VWContentCategoryAutomotiveSedan = 1024,
  VWContentCategoryAutomotiveTrucksAccessories = 1025,
  VWContentCategoryAutomotiveVintageCars = 1026,
  VWContentCategoryAutomotiveWagon = 1027,
  
  /* Business */
  VWContentCategoryBusiness = 22,
  VWContentCategoryBusinessAdvertising = 1028,
  VWContentCategoryBusinessAgriculture = 1029,
  VWContentCategoryBusinessBiotechBiomedical = 1030,
  VWContentCategoryBusinessBusinessSoftware = 1031,
  VWContentCategoryBusinessConstruction = 1032,
  VWContentCategoryBusinessForestry = 1033,
  VWContentCategoryBusinessGovernment = 1034,
  VWContentCategoryBusinessGreenSolutions = 1035,
  VWContentCategoryBusinessHumanResources = 1036,
  VWContentCategoryBusinessLogistics = 1037,
  VWContentCategoryBusinessMarketing = 1038,
  VWContentCategoryBusinessMetals = 1039,
  
  /* Careers */
  VWContentCategoryCareers = 15,
  VWContentCategoryCareersCareerAdvice = 1050,
  VWContentCategoryCareersCareerPlanning = 1040,
  VWContentCategoryCareersCollege = 1041,
  VWContentCategoryCareersFinancialAid = 1042,
  VWContentCategoryCareersJobFairs = 1043,
  VWContentCategoryCareersJobSearch = 1044,
  VWContentCategoryCareersNursing = 1046,
  VWContentCategoryCareersResumeWritingAdvice = 1045,
  VWContentCategoryCareersScholarships = 1047,
  VWContentCategoryCareersTelecommuting = 1048,
  VWContentCategoryCareersUSMilitary = 1049,
  
  /* Education */
  VWContentCategoryEducation = 1051,
  VWContentCategoryEducation712Education = 1052,
  VWContentCategoryEducationAdultEducation = 1053,
  VWContentCategoryEducationArtHistory = 1054,
  VWContentCategoryEducationCollegeAdministration = 1055,
  VWContentCategoryEducationCollegeLife = 1056,
  VWContentCategoryEducationDistanceLearning = 1057,
  VWContentCategoryEducationEnglishasa2ndLanguage = 1058,
  VWContentCategoryEducationGraduateSchool = 1060,
  VWContentCategoryEducationHomeschooling = 1061,
  VWContentCategoryEducationHomeworkStudyTips = 1062,
  VWContentCategoryEducationK6Educators = 1063,
  VWContentCategoryEducationLanguageLearning = 1059,
  VWContentCategoryEducationPrivateSchool = 1064,
  VWContentCategoryEducationSpecialEducation = 1065,
  VWContentCategoryEducationStudyingBusiness = 1066,
  
  /* Events */
  VWContentCategoryEvents = 37,
  
  /* Family and Parenting */
  VWContentCategoryFamilyAndParenting = 34,
  VWContentCategoryFamilyAndParentingAdoption = 1067,
  VWContentCategoryFamilyAndParentingBabiesAndToddlers = 1068,
  VWContentCategoryFamilyAndParentingDaycarePreSchool = 1069,
  VWContentCategoryFamilyAndParentingEldercare = 1075,
  VWContentCategoryFamilyAndParentingFamilyInternet = 1070,
  VWContentCategoryFamilyAndParentingParentingK6Kids = 1071,
  VWContentCategoryFamilyAndParentingParentingTeens = 1072,
  VWContentCategoryFamilyAndParentingPregnancy = 1073,
  VWContentCategoryFamilyAndParentingSpecialNeedsKids = 1074,
  
  /* Food and Drink */
  VWContentCategoryFoodAndDrink = 52,
  VWContentCategoryFoodAndDrinkAmericanCuisine = 1122,
  VWContentCategoryFoodAndDrinkBarbecuesAndGrilling = 1123,
  VWContentCategoryFoodAndDrinkCajunCreole = 1124,
  VWContentCategoryFoodAndDrinkChineseCuisine = 1125,
  VWContentCategoryFoodAndDrinkCocktailsBeer = 1126,
  VWContentCategoryFoodAndDrinkCoffeeTea = 1127,
  VWContentCategoryFoodAndDrinkCuisineSpecific = 1128,
  VWContentCategoryFoodAndDrinkDessertsAndBaking = 1129,
  VWContentCategoryFoodAndDrinkDiningOut = 1130,
  VWContentCategoryFoodAndDrinkFoodAllergies = 1131,
  VWContentCategoryFoodAndDrinkFrenchCuislne = 1132,
  VWContentCategoryFoodAndDrinkHealthLowFatCooking = 1133,
  VWContentCategoryFoodAndDrinkItalianCuisine = 1134,
  VWContentCategoryFoodAndDrinkJapaneseCuisine = 1135,
  VWContentCategoryFoodAndDrinkMexicanCuisine = 1136,
  VWContentCategoryFoodAndDrinkVegan = 1137,
  VWContentCategoryFoodAndDrinkVegetarian = 1138,
  VWContentCategoryFoodAndDrinkWine = 1139,
  
  /* Health and Fitness */
  VWContentCategoryHealthAndFitness = 1076,
  VWContentCategoryHealthAndFitnessADD = 1078,
  VWContentCategoryHealthAndFitnessAIDSHIV = 1079,
  VWContentCategoryHealthAndFitnessAllergies = 1080,
  VWContentCategoryHealthAndFitnessAlternativeMedicine = 1081,
  VWContentCategoryHealthAndFitnessArthritis = 1082,
  VWContentCategoryHealthAndFitnessAsthma = 1083,
  VWContentCategoryHealthAndFitnessAutismPDD = 1084,
  VWContentCategoryHealthAndFitnessBipolarDisorder = 1085,
  VWContentCategoryHealthAndFitnessBrainTumor = 1086,
  VWContentCategoryHealthAndFitnessCancer = 1087,
  VWContentCategoryHealthAndFitnessCholesterol = 1088,
  VWContentCategoryHealthAndFitnessChronicFatigueSyndrome = 1089,
  VWContentCategoryHealthAndFitnessChronicPain = 1090,
  VWContentCategoryHealthAndFitnessColdAndFlu = 1091,
  VWContentCategoryHealthAndFitnessDeafness = 1092,
  VWContentCategoryHealthAndFitnessDentalCare = 1093,
  VWContentCategoryHealthAndFitnessDepression = 1094,
  VWContentCategoryHealthAndFitnessDermatology = 1095,
  VWContentCategoryHealthAndFitnessDiabetes = 1096,
  VWContentCategoryHealthAndFitnessEpilepsy = 1097,
  VWContentCategoryHealthAndFitnessExercise = 1077,
  VWContentCategoryHealthAndFitnessGERDAcidReflux = 1098,
  VWContentCategoryHealthAndFitnessHeadachesMigraines = 1099,
  VWContentCategoryHealthAndFitnessHeartDisease = 1100,
  VWContentCategoryHealthAndFitnessHerbsforHealth = 1101,
  VWContentCategoryHealthAndFitnessHolisticHealing = 1102,
  VWContentCategoryHealthAndFitnessIBSCrohnsDisease = 1103,
  VWContentCategoryHealthAndFitnessIncestAbuseSupport = 1104,
  VWContentCategoryHealthAndFitnessIncontinence = 1105,
  VWContentCategoryHealthAndFitnessInfertility = 1106,
  VWContentCategoryHealthAndFitnessMensHealth = 1107,
  VWContentCategoryHealthAndFitnessNutrition = 1108,
  VWContentCategoryHealthAndFitnessOrthopedics = 1109,
  VWContentCategoryHealthAndFitnessPanicAnxietyDisorders = 1110,
  VWContentCategoryHealthAndFitnessPediatrics = 1111,
  VWContentCategoryHealthAndFitnessPhysicalTherapy = 1112,
  VWContentCategoryHealthAndFitnessPsychologyPsychiatry = 1113,
  VWContentCategoryHealthAndFitnessSeniorHealth = 1114,
  VWContentCategoryHealthAndFitnessSexuality = 1115,
  VWContentCategoryHealthAndFitnessSleepDisorders = 1116,
  VWContentCategoryHealthAndFitnessSmokingCessation = 1117,
  VWContentCategoryHealthAndFitnessSubstanceAbuse = 1118,
  VWContentCategoryHealthAndFitnessThyroidDisease = 1119,
  VWContentCategoryHealthAndFitnessWeightLoss = 1120,
  VWContentCategoryHealthAndFitnessWomensHealth = 1121,
  
  /* Hobbies and Interests */
  VWContentCategoryHobbiesAndInterests = 44,
  VWContentCategoryHobbiesAndInterestsArtsAndCrafts = 1141,
  VWContentCategoryHobbiesAndInterestsArtsTechnology = 1140,
  VWContentCategoryHobbiesAndInterestsBeadwork = 1142,
  VWContentCategoryHobbiesAndInterestsBirdwatching = 1143,
  VWContentCategoryHobbiesAndInterestsBoardGamesPuzzles = 1144,
  VWContentCategoryHobbiesAndInterestsCandleAndSoapMaking = 1145,
  VWContentCategoryHobbiesAndInterestsCardGames = 1146,
  VWContentCategoryHobbiesAndInterestsChess = 1147,
  VWContentCategoryHobbiesAndInterestsCigars = 1148,
  VWContentCategoryHobbiesAndInterestsCollecting = 1149,
  VWContentCategoryHobbiesAndInterestsComicBooks = 1150,
  VWContentCategoryHobbiesAndInterestsDrawingSketching = 1151,
  VWContentCategoryHobbiesAndInterestsFreelanceWriting = 1152,
  VWContentCategoryHobbiesAndInterestsGenealogy = 1153,
  VWContentCategoryHobbiesAndInterestsGettingPublishing = 1154,
  VWContentCategoryHobbiesAndInterestsGuitar = 1155,
  VWContentCategoryHobbiesAndInterestsHomeRecording = 1156,
  VWContentCategoryHobbiesAndInterestsInvestorsAndPatents = 1157,
  VWContentCategoryHobbiesAndInterestsJewelryMaking = 1158,
  VWContentCategoryHobbiesAndInterestsMagicAndIllusion = 1159,
  VWContentCategoryHobbiesAndInterestsNeedlework = 1160,
  VWContentCategoryHobbiesAndInterestsPainting = 1161,
  VWContentCategoryHobbiesAndInterestsPhotography = 1162,
  VWContentCategoryHobbiesAndInterestsRadio = 1163,
  VWContentCategoryHobbiesAndInterestsRoleplayingGames = 1164,
  VWContentCategoryHobbiesAndInterestsSciFiAndFantasy = 1165,
  VWContentCategoryHobbiesAndInterestsScrapbooking = 1166,
  VWContentCategoryHobbiesAndInterestsScreenwriting = 1167,
  VWContentCategoryHobbiesAndInterestsStampsAndCoins = 1168,
  VWContentCategoryHobbiesAndInterestsVideoAndComputerGames = 1169,
  VWContentCategoryHobbiesAndInterestsWoodworking = 1170,
  
  /* Home and Garden */
  VWContentCategoryHomeAndGarden = 1171,
  VWContentCategoryHomeAndGardenAppliances = 1172,
  VWContentCategoryHomeAndGardenEntertaining = 1173,
  VWContentCategoryHomeAndGardenEnvironmentalSafety = 1174,
  VWContentCategoryHomeAndGardenGardening = 1175,
  VWContentCategoryHomeAndGardenHomeRepair = 1176,
  VWContentCategoryHomeAndGardenHomeTheater = 1177,
  VWContentCategoryHomeAndGardenInteriorDecorating = 1178,
  VWContentCategoryHomeAndGardenLandscaping = 1179,
  VWContentCategoryHomeAndGardenRemodelingAndConstruction = 1180,
  
  /* Law Gov't and Politics */
  VWContentCategoryLawGovtAndPolitics = 1181,
  VWContentCategoryLawGovtAndPoliticsCommentary = 1186,
  VWContentCategoryLawGovtAndPoliticsImmigration = 1182,
  VWContentCategoryLawGovtAndPoliticsLegalIssues = 1183,
  VWContentCategoryLawGovtAndPoliticsPolitics = 1185,
  VWContentCategoryLawGovtAndPoliticsUSGovernmentResources = 1184,
  
  /* Movies */
  VWContentCategoryMovies = 40,
  
  /* Music */
  VWContentCategoryMusic = 77,
  
  /* News and Information */
  VWContentCategoryNewsAndInformation = 97,
  VWContentCategoryNewsAndInformationInternationalNews = 83,
  VWContentCategoryNewsAndInformationLocal = 84,
  VWContentCategoryNewsAndInformationNational = 86,
  VWContentCategoryNewsAndInformationRegional = 87,
  
  /* Obituaries */
  VWContentCategoryObituaries = 38,
  
  /* Personal Finance */
  VWContentCategoryPersonalFinance = 1187,
  VWContentCategoryPersonalFinanceBeginningInvesting = 1188,
  VWContentCategoryPersonalFinanceCreditDebtAndLoans = 1189,
  VWContentCategoryPersonalFinanceFinancialNews = 1190,
  VWContentCategoryPersonalFinanceFinancialPlanning = 1191,
  VWContentCategoryPersonalFinanceHedgeFund = 1192,
  VWContentCategoryPersonalFinanceInsurance = 1193,
  VWContentCategoryPersonalFinanceInvesting = 1194,
  VWContentCategoryPersonalFinanceMutualFunds = 1195,
  VWContentCategoryPersonalFinanceOptions = 1196,
  VWContentCategoryPersonalFinanceRetirementPlanning = 1197,
  VWContentCategoryPersonalFinanceStocks = 1198,
  VWContentCategoryPersonalFinanceTaxPlanning = 1199,
  
  /* Pets */
  VWContentCategoryPets = 1219,
  VWContentCategoryPetsAquariums = 1220,
  VWContentCategoryPetsBirds = 1221,
  VWContentCategoryPetsCats = 1222,
  VWContentCategoryPetsDogs = 1223,
  VWContentCategoryPetsLargeAnimals = 1224,
  VWContentCategoryPetsReptiles = 1225,
  VWContentCategoryPetsVeterinaryMedicine = 1226,
  
  /* Real Estate */
  VWContentCategoryRealEstate = 134,
  VWContentCategoryRealEstateApartments = 1339,
  VWContentCategoryRealEstateArchitects = 1340,
  VWContentCategoryRealEstateBuyingSellingHomes = 1341,
  
  /* Religion and Spirituality */
  VWContentCategoryReligionAndSpirituality = 1346,
  VWContentCategoryReligionAndSpiritualityAlternativeReligions = 1347,
  VWContentCategoryReligionAndSpiritualityAtheismAgnosticism = 1348,
  VWContentCategoryReligionAndSpiritualityBuddhism = 1349,
  VWContentCategoryReligionAndSpiritualityCatholicism = 1350,
  VWContentCategoryReligionAndSpiritualityChristianity = 1351,
  VWContentCategoryReligionAndSpiritualityHinduism = 1352,
  VWContentCategoryReligionAndSpiritualityIslam = 1353,
  VWContentCategoryReligionAndSpiritualityJudaism = 1354,
  VWContentCategoryReligionAndSpiritualityLatterDaySaints = 1355,
  VWContentCategoryReligionAndSpiritualityPaganWiccan = 1356,
  
  /* Science */
  VWContentCategoryScience = 1209,
  VWContentCategoryScienceAstrology = 1210,
  VWContentCategoryScienceBiology = 1211,
  VWContentCategoryScienceBotany = 1218,
  VWContentCategoryScienceChemistry = 1212,
  VWContentCategoryScienceGeography = 1217,
  VWContentCategoryScienceGeology = 1213,
  VWContentCategoryScienceParanormalPhenomena = 1214,
  VWContentCategorySciencePhysics = 1215,
  VWContentCategoryScienceSpaceAstronomy = 1216,
  
  /* Shopping */
  VWContentCategoryShopping = 1342,
  VWContentCategoryShoppingComparisonEngines = 1345,
  VWContentCategoryShoppingContestsAndFreebies = 1343,
  VWContentCategoryShoppingCouponing = 1344,
  
  /* Society */
  VWContentCategorySociety = 1200,
  VWContentCategorySocietyDating = 1201,
  VWContentCategorySocietyDivorceSupport = 1202,
  VWContentCategorySocietyEthnicSpecific = 1208,
  VWContentCategorySocietyGayLife = 1203,
  VWContentCategorySocietyMarriage = 1204,
  VWContentCategorySocietySeniorLiving = 1205,
  VWContentCategorySocietyTeens = 1206,
  VWContentCategorySocietyWeddings = 1207,
  
  /* Sports */
  VWContentCategorySports = 110,
  VWContentCategorySportsAutoRacing = 1227,
  VWContentCategorySportsBaseball = 1228,
  VWContentCategorySportsBicycling = 1229,
  VWContentCategorySportsBodybuilding = 1230,
  VWContentCategorySportsBoxing = 1231,
  VWContentCategorySportsCanoeingKayaking = 1232,
  VWContentCategorySportsCheerleading = 1233,
  VWContentCategorySportsClimbing = 1234,
  VWContentCategorySportsCricket = 1235,
  VWContentCategorySportsFigureSkating = 1236,
  VWContentCategorySportsFlyFishing = 1237,
  VWContentCategorySportsFootball = 1238,
  VWContentCategorySportsFreshwaterFishing = 1239,
  VWContentCategorySportsGameAndFish = 1240,
  VWContentCategorySportsHorseRacing = 1241,
  VWContentCategorySportsHorses = 1242,
  VWContentCategorySportsHuntingShooting = 1243,
  VWContentCategorySportsInlineSkating = 1244,
  VWContentCategorySportsMartialArts = 1245,
  VWContentCategorySportsMountainBiking = 1246,
  VWContentCategorySportsNASCARRacing = 1247,
  VWContentCategorySportsOlympics = 1248,
  VWContentCategorySportsPaintball = 1249,
  VWContentCategorySportsPowerAndMotorcycles = 1250,
  VWContentCategorySportsProBasketball = 1251,
  VWContentCategorySportsProIceHockey = 1252,
  VWContentCategorySportsRodeo = 1253,
  VWContentCategorySportsRugby = 1254,
  VWContentCategorySportsRunningJogging = 1255,
  VWContentCategorySportsSailing = 1256,
  VWContentCategorySportsSaltwaterFishing = 1257,
  VWContentCategorySportsScubaDiving = 1258,
  VWContentCategorySportsSkateboarding = 1259,
  VWContentCategorySportsSkiing = 1260,
  VWContentCategorySportsSnowboarding = 1261,
  VWContentCategorySportsSurfingBodyboarding = 1262,
  VWContentCategorySportsSwimming = 1263,
  VWContentCategorySportsTableTennisPingPong = 1264,
  VWContentCategorySportsTennis = 1265,
  VWContentCategorySportsVolleyball = 1266,
  VWContentCategorySportsWalking = 1267,
  VWContentCategorySportsWaterskiWakeboard = 1268,
  VWContentCategorySportsWorldSoccer = 1269,
  
  /* Style and Fashion */
  VWContentCategoryStyleAndFashion = 93,
  VWContentCategoryStyleAndFashionAccessories = 1275,
  VWContentCategoryStyleAndFashionBeauty = 1270,
  VWContentCategoryStyleAndFashionBodyArt = 1271,
  VWContentCategoryStyleAndFashionClothing = 1274,
  VWContentCategoryStyleAndFashionFashion = 1272,
  VWContentCategoryStyleAndFashionJewelry = 1273,
  
  /* Technology and Computing */
  VWContentCategoryTechnologyAndComputing = 117,
  VWContentCategoryTechnologyAndComputing3DGraphics = 1276,
  VWContentCategoryTechnologyAndComputingAnimation = 1277,
  VWContentCategoryTechnologyAndComputingAntiviusSoftware = 1278,
  VWContentCategoryTechnologyAndComputingCCPlusPlus = 1279,
  VWContentCategoryTechnologyAndComputingCamerasAndCamcorders = 1280,
  VWContentCategoryTechnologyAndComputingCellPhones = 1281,
  VWContentCategoryTechnologyAndComputingComputerCertification = 1282,
  VWContentCategoryTechnologyAndComputingComputerNetworking = 1283,
  VWContentCategoryTechnologyAndComputingComputerPeripherals = 1284,
  VWContentCategoryTechnologyAndComputingComputerReviews = 1285,
  VWContentCategoryTechnologyAndComputingDataCenters = 1286,
  VWContentCategoryTechnologyAndComputingDatabases = 1287,
  VWContentCategoryTechnologyAndComputingDesktopPublishing = 1288,
  VWContentCategoryTechnologyAndComputingDesktopVideo = 1289,
  VWContentCategoryTechnologyAndComputingEmail = 1290,
  VWContentCategoryTechnologyAndComputingGraphicsSoftware = 1291,
  VWContentCategoryTechnologyAndComputingHomeVideoDVD = 1292,
  VWContentCategoryTechnologyAndComputingInternetTechnology = 1293,
  VWContentCategoryTechnologyAndComputingJava = 1294,
  VWContentCategoryTechnologyAndComputingJavaScript = 1295,
  VWContentCategoryTechnologyAndComputingLinux = 1296,
  VWContentCategoryTechnologyAndComputingMacOS = 1297,
  VWContentCategoryTechnologyAndComputingMacSupport = 1298,
  VWContentCategoryTechnologyAndComputingMP3MIDI = 1299,
  VWContentCategoryTechnologyAndComputingNetConferencing = 1300,
  VWContentCategoryTechnologyAndComputingNetforBeginners = 1301,
  VWContentCategoryTechnologyAndComputingNetworkSecurity = 1302,
  VWContentCategoryTechnologyAndComputingPalmtopsPDAs = 1303,
  VWContentCategoryTechnologyAndComputingPCSupport = 1304,
  VWContentCategoryTechnologyAndComputingPortableEntertainment = 1305,
  VWContentCategoryTechnologyAndComputingSharewareFreeware = 1306,
  VWContentCategoryTechnologyAndComputingUnix = 1307,
  VWContentCategoryTechnologyAndComputingVisualBasic = 1308,
  VWContentCategoryTechnologyAndComputingWebClipArt = 1309,
  VWContentCategoryTechnologyAndComputingWebDesignHTML = 1310,
  VWContentCategoryTechnologyAndComputingWebSearch = 1311,
  VWContentCategoryTechnologyAndComputingWindows = 1312,
  
  /* Traffic */
  VWContentCategoryTraffic = 135,
  
  /* Travel */
  VWContentCategoryTravel = 122,
  VWContentCategoryTravelAdventureTravel = 1313,
  VWContentCategoryTravelAfrica = 1314,
  VWContentCategoryTravelAirTravel = 1315,
  VWContentCategoryTravelAustraliaAndNewZealand = 1316,
  VWContentCategoryTravelBedAndBreakfast = 1317,
  VWContentCategoryTravelBudgetTravel = 1318,
  VWContentCategoryTravelBusinessTravel = 1319,
  VWContentCategoryTravelByUSLocale = 1320,
  VWContentCategoryTravelCamping = 1321,
  VWContentCategoryTravelCanada = 1322,
  VWContentCategoryTravelCaribbean = 1323,
  VWContentCategoryTravelCruises = 1324,
  VWContentCategoryTravelEasternEurope = 1325,
  VWContentCategoryTravelEurope = 1326,
  VWContentCategoryTravelFrance = 1327,
  VWContentCategoryTravelGreece = 1328,
  VWContentCategoryTravelHoneymoonsGetaways = 1329,
  VWContentCategoryTravelHotels = 1330,
  VWContentCategoryTravelJapan = 1331,
  VWContentCategoryTravelMexicoAndCentralAmerica = 1332,
  VWContentCategoryTravelNationalParks = 1333,
  VWContentCategoryTravelSouthAmerica = 1334,
  VWContentCategoryTravelSpas = 1335,
  VWContentCategoryTravelThemeParks = 1336,
  VWContentCategoryTravelTravelingWithKids = 1337,
  VWContentCategoryTravelUnitedKingdom = 1338,
  
  /* Weather */
  VWContentCategoryWeather = 133,
};

#endif
