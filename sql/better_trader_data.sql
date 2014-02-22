/* add air vehicles */
INSERT INTO `Traders_DATA` select '["GNT_C185F",1]'        as item, 9999 as qty, buy, sell, order, tid, afile from `Traders_DATA` where item = '["GNT_C185",1]';
INSERT INTO `Traders_DATA` select '["GNT_C185E",1]'        as item, 9999 as qty, buy, sell, order, tid, afile from `Traders_DATA` where item = '["GNT_C185",1]';
INSERT INTO `Traders_DATA` select '["MH6J_EP1",1]'         as item, 9999 as qty, buy, sell, order, tid, afile from `Traders_DATA` where item = '["AH6X_DZ",1]';
INSERT INTO `Traders_DATA` select '["An2_1_TK_CIV_EP1",1]' as item, 9999 as qty, buy, sell, order, tid, afile from `Traders_DATA` where item = '["AN2_DZ",1]';
INSERT INTO `Traders_DATA` select '["An2_2_TK_CIV_EP1",1]' as item, 9999 as qty, buy, sell, order, tid, afile from `Traders_DATA` where item = '["AN2_DZ",1]';
INSERT INTO `Traders_DATA` select '["An2_TK_EP1",1]'       as item, 9999 as qty, buy, sell, order, tid, afile from `Traders_DATA` where item = '["AN2_DZ",1]';
INSERT INTO `Traders_DATA` select '["Ka137_PMC",1]'        as item, 9999 as qty, buy, sell, order, tid, afile from `Traders_DATA` where item = '["CSJ_GyroC",1]';
/* add normal land vehicles */
INSERT INTO `Traders_DATA` select '["policecar",1]'          as item, 9999 as qty, buy, sell, order, tid, afile from `Traders_DATA` where item = '["Skoda",1]';
INSERT INTO `Traders_DATA` select '["TowingTractor",1]'      as item, 9999 as qty, buy, sell, order, tid, afile from `Traders_DATA` where item = '["MMT_Civ",1]';
INSERT INTO `Traders_DATA` select '["HMMWV_Terminal_EP1",1]' as item, 9999 as qty, buy, sell, order, tid, afile from `Traders_DATA` where item = '["HMMWV_Ambulance",1]';
/* military vehicles */ 
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_M2",1]'                ,9999,'[4,"ItemGoldBar10oz",1]'        ,'[2,"ItemGoldBar10oz",1]'        ,0,479     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_M2",1]'                ,9999,'[4,"ItemGoldBar10oz",1]'        ,'[2,"ItemGoldBar10oz",1]'        ,0,534     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["UAZ_MG_CDF",1]'              ,9999,'[3,"ItemGoldBar10oz",1]'        ,'[1,"ItemGoldBar10oz",1]'        ,0,479     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["UAZ_MG_INS",1]'              ,9999,'[3,"ItemGoldBar10oz",1]'        ,'[1,"ItemGoldBar10oz",1]'        ,0,534     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["Pickup_PK_GUE",1]'           ,9999,'[2,"ItemGoldBar10oz",1]'        ,'[1,"ItemGoldBar10oz",1]'        ,0,479     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["Pickup_PK_INS",1]'           ,9999,'[2,"ItemGoldBar10oz",1]'        ,'[1,"ItemGoldBar10oz",1]'        ,0,534     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["Offroad_DSHKM_Gue",1]'       ,9999,'[3,"ItemGoldBar10oz",1]'        ,'[1,"ItemGoldBar10oz",1]'        ,0,479     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["Offroad_DSHKM_INS",1]'       ,9999,'[3,"ItemGoldBar10oz",1]'        ,'[1,"ItemGoldBar10oz",1]'        ,0,534     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_Armored",1]'           ,9999,'[8,"ItemGoldBar10oz",1]'        ,'[4,"ItemGoldBar10oz",1]'        ,0,479     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_Armored",1]'           ,9999,'[8,"ItemGoldBar10oz",1]'        ,'[4,"ItemGoldBar10oz",1]'        ,0,534     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BTR40_MG_TK_GUE_EP1",1]'     ,9999,'[8,"ItemGoldBar10oz",1]'        ,'[4,"ItemGoldBar10oz",1]'        ,0,479     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BTR40_MG_TK_INS_EP1",1]'     ,9999,'[8,"ItemGoldBar10oz",1]'        ,'[4,"ItemGoldBar10oz",1]'        ,0,534     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BTR40_TK_GUE_EP1",1]'        ,9999,'[3,"ItemGoldBar10oz",1]'        ,'[1,"ItemGoldBar10oz",1]'        ,0,479     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BTR40_TK_INS_EP1",1]'        ,9999,'[3,"ItemGoldBar10oz",1]'        ,'[1,"ItemGoldBar10oz",1]'        ,0,534     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["LandRover_MG_TK_EP1_DZE",1]' ,9999,'[3,"ItemGoldBar10oz",1]'        ,'[1,"ItemGoldBar10oz",1]'        ,0,479     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["LandRover_MG_TK_EP1_DZE",1]' ,9999,'[3,"ItemGoldBar10oz",1]'        ,'[1,"ItemGoldBar10oz",1]'        ,0,534     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BAF_Jackal2_L2A1_W",1]'      ,9999,'[5,"ItemGoldBar10oz",1]'        ,'[2,"ItemGoldBar10oz",1]'        ,0,479     ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BAF_Jackal2_L2A1_W",1]'      ,9999,'[5,"ItemGoldBar10oz",1]'        ,'[2,"ItemGoldBar10oz",1]'        ,0,534     ,'trade_any_vehicle');
/* add extreme military vehicles */
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_M998_crows_M2_DES_EP1",1]'  ,9999,'[2,"ItemBriefcase100oz",1]'    ,'[1,"ItemBriefcase100oz",1]'   ,0,479    ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_M998_crows_M2_DES_EP1",1]'  ,9999,'[2,"ItemBriefcase100oz",1]'    ,'[1,"ItemBriefcase100oz",1]'   ,0,534    ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BRDM2_HQ_Gue",1]'                 ,9999,'[2,"ItemBriefcase100oz",1]'    ,'[1,"ItemBriefcase100oz",1]'   ,0,479    ,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BRDM2_HQ_Gue",1]'                 ,9999,'[2,"ItemBriefcase100oz",1]'    ,'[1,"ItemBriefcase100oz",1]'   ,0,534    ,'trade_any_vehicle');
