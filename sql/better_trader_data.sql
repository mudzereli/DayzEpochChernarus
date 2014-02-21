/* BACK UP TRADERS DATA */
create table if not exists O_Traders_DATA as select * from Traders_DATA;

/* TRADERS_DATA CREATE TABLE FOR EDITING VALUES */
drop table if exists traders_base;
create table traders_base as
select 	`a`.`id` 											AS `id`,
		substr(`a`.`item`,3,(locate('"',`a`.`item`,3) - 3)) AS `item_class`,
		mid(reverse(`a`.`item`),2,1)                        AS `item_type`,
		`a`.`afile` 										AS `afile`,
		`a`.`qty` 											AS `qty`,
		substr(`a`.`buy`,2,1) 								AS `buy_count`,
		substr(`a`.`buy`,5,(locate('"',`a`.`buy`,5) - 5)) 	AS `buy_class`,
		`a`.`tid` 											AS `tid` 
from `O_Traders_DATA` `a`;

/* INSERT NEW AIR VEHICLES INTO THE TRADERS USING EXISTING ONES AS TEMPLATES */
insert into traders_base (item_class, item_type, afile, qty, buy_count, buy_class, tid) 
select concat(a.item_class,"F"), a.item_type, a.afile, a.qty, a.buy_count, a.buy_class, a.tid from traders_base a where a.item_class = "GNT_C185"
union all
select concat(a.item_class,"E"), a.item_type, a.afile, a.qty, a.buy_count, a.buy_class, a.tid from traders_base a where a.item_class = "GNT_C185"
union all
select "MH6J_EP1", a.item_type, a.afile, a.qty, a.buy_count, a.buy_class, a.tid from traders_base a where a.item_class = "AH6X_DZ"
union all
select "An2_1_TK_CIV_EP1", a.item_type, a.afile, a.qty, a.buy_count, a.buy_class, a.tid from traders_base a where a.item_class = "AN2_DZ"
union all
select "An2_2_TK_CIV_EP1", a.item_type, a.afile, a.qty, a.buy_count, a.buy_class, a.tid from traders_base a where a.item_class = "AN2_DZ"
union all
select "An2_TK_EP1", a.item_type, a.afile, a.qty, a.buy_count, a.buy_class, a.tid from traders_base a where a.item_class = "AN2_DZ"
union all
select "Ka137_PMC", a.item_type, a.afile, a.qty, a.buy_count, a.buy_class, a.tid from traders_base a where a.item_class = "CSJ_GyroC"
;

/* INSERT NEW LAND VEHICLES INTO THE TRADERS USING EXISTING ONES AS TEMPLATES */
insert into traders_base (item_class, item_type, afile, qty, buy_count, buy_class, tid) 
select "policecar" as item_class, a.item_type, a.afile, a.qty, a.buy_count, a.buy_class, a.tid from traders_base a where a.item_class = "Skoda"
union all
select "TowingTractor" as item_class, a.item_type, a.afile, a.qty, a.buy_count, a.buy_class, a.tid from traders_base a where a.item_class = "MMT_Civ"
union all
select "HMMWV_Terminal_EP1" as item_class, a.item_type, a.afile, a.qty, a.buy_count, a.buy_class, a.tid from traders_base a where a.item_class = "HMMWV_Ambulance"
;

/* TWEAK PRICING TO BE MORE CONVENIENT TO PLAYERS */
update traders_base a set a.buy_class = "ItemSilverBar", a.buy_count = 1 where a.buy_class = "ItemCopperBar";
update traders_base a set a.buy_class = "ItemSilverBar", a.buy_count = 1 where a.buy_class = "ItemCopperBar10oz";
update traders_base a set a.buy_count = 2 where a.buy_count = 1 and a.buy_class = "ItemSilverBar";
update traders_base a set a.buy_count = 5 where a.buy_count > 5 and a.buy_class = "ItemSilverBar";
update traders_base a set a.qty = 99999;

/* CREATE NEW TRADERS_DATA TABLE */
truncate table Traders_DATA;
insert into Traders_DATA
select 	a.id,
		concat('["',a.item_class,'",',a.item_type,']') as item,
		a.qty,
		concat('[',greatest(floor(a.buy_count),1),',"',a.buy_class,'",1]') as buy,
		case	
			when a.buy_count > 1 then concat('[',greatest(floor(a.buy_count/2),1),',"',a.buy_class,'",1]') 
			when a.buy_class = "ItemSilverBar10oz" then concat('[5,"ItemSilverBar",1]') 
			when a.buy_class = "ItemGoldBar10oz" then concat('[5,"ItemGoldBar",1]') 
			when a.buy_class = "ItemBriefcase100oz" then concat('[5,"ItemGoldBar10oz",1]') 
			when a.buy_class = "ItemGoldBar" then concat('[1,"ItemSilverBar10oz",1]') 
		end as sell,
		0 as `order`,
		a.tid,
		a.afile
from 	traders_base a;

/* add extreme military vehicles */
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_M998_crows_M2_DES_EP1",1]'	,9999,'[2,"ItemBriefcase100oz",1]'	,'[1,"ItemBriefcase100oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_M998_crows_M2_DES_EP1",1]'  ,9999,'[2,"ItemBriefcase100oz",1]'	,'[1,"ItemBriefcase100oz",1]'	,0,534,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BRDM2_HQ_Gue",1]'   				,9999,'[2,"ItemBriefcase100oz",1]'	,'[1,"ItemBriefcase100oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BRDM2_HQ_Gue",1]'   				,9999,'[2,"ItemBriefcase100oz",1]'	,'[1,"ItemBriefcase100oz",1]'	,0,534,'trade_any_vehicle');
/* */

/* military vehicles */
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_M2",1]'  ,9999,'[4,"ItemGoldBar10oz",1]'	,'[2,"ItemGoldBar10oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_M2",1]'  ,9999,'[4,"ItemGoldBar10oz",1]'	,'[2,"ItemGoldBar10oz",1]'	,0,534,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["UAZ_MG_CDF",1]'  ,9999,'[3,"ItemGoldBar10oz",1]'	,'[1,"ItemGoldBar10oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["UAZ_MG_INS",1]'  ,9999,'[3,"ItemGoldBar10oz",1]'	,'[1,"ItemGoldBar10oz",1]'	,0,534,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["Pickup_PK_GUE",1]'  ,9999,'[2,"ItemGoldBar10oz",1]'	,'[1,"ItemGoldBar10oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["Pickup_PK_INS",1]'  ,9999,'[2,"ItemGoldBar10oz",1]'	,'[1,"ItemGoldBar10oz",1]'	,0,534,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["Offroad_DSHKM_Gue",1]'  ,9999,'[3,"ItemGoldBar10oz",1]'	,'[1,"ItemGoldBar10oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["Offroad_DSHKM_INS",1]'  ,9999,'[3,"ItemGoldBar10oz",1]'	,'[1,"ItemGoldBar10oz",1]'	,0,534,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_Armored",1]'  ,9999,'[8,"ItemGoldBar10oz",1]'	,'[4,"ItemGoldBar10oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["HMMWV_Armored",1]'  ,9999,'[8,"ItemGoldBar10oz",1]'	,'[4,"ItemGoldBar10oz",1]'	,0,534,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BTR40_MG_TK_GUE_EP1",1]'  ,9999,'[8,"ItemGoldBar10oz",1]'	,'[4,"ItemGoldBar10oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BTR40_MG_TK_INS_EP1",1]'  ,9999,'[8,"ItemGoldBar10oz",1]'	,'[4,"ItemGoldBar10oz",1]'	,0,534,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BTR40_TK_GUE_EP1",1]'  ,9999,'[3,"ItemGoldBar10oz",1]'	,'[1,"ItemGoldBar10oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BTR40_TK_INS_EP1",1]'  ,9999,'[3,"ItemGoldBar10oz",1]'	,'[1,"ItemGoldBar10oz",1]'	,0,534,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["LandRover_MG_TK_EP1_DZE",1]'  ,9999,'[3,"ItemGoldBar10oz",1]'	,'[1,"ItemGoldBar10oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["LandRover_MG_TK_EP1_DZE",1]'  ,9999,'[3,"ItemGoldBar10oz",1]'	,'[1,"ItemGoldBar10oz",1]'	,0,534,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BAF_Jackal2_L2A1_W",1]'  ,9999,'[5,"ItemGoldBar10oz",1]'	,'[2,"ItemGoldBar10oz",1]'	,0,479,'trade_any_vehicle');
INSERT INTO `Traders_DATA` (`item`, `qty`, `buy`, `sell`, `order`, `tid`, `afile`) VALUES ('["BAF_Jackal2_L2A1_W",1]'  ,9999,'[5,"ItemGoldBar10oz",1]'	,'[2,"ItemGoldBar10oz",1]'	,0,534,'trade_any_vehicle');
