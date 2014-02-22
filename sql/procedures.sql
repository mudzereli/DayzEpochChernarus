drop procedure if exists p_remove_damaged_vehicles;
delimiter //
create procedure p_remove_damaged_vehicles()
comment 'Moves destroyed vehicles from main table to deleted objects table. This keeps them from being loaded into the game.'
begin
	insert into t_deleted_objects select * from object_data where damage = 1;
	delete from object_data where damage = 1;
end//
delimiter ;

drop procedure if exists p_restore_gear;
delimiter //
create procedure p_restore_gear(in _PLAYERUID text, in _DEATHNUMBER int, in _TELEPORT int, in _MODEL int)
comment 'Restores the gear/model/location of a player who died based on playeruid and death number.'
begin
	select a.INVENTORY, a.BACKPACK, a.WORLDSPACE, a.MODEL into @INVENTORY, @BACKPACK, @WORLDSPACE, @MODEL
        from (select * from character_data where PLAYERUID = _PLAYERUID and ALIVE = 0 order by CHARACTERID desc limit _DEATHNUMBER) a 
        order by a.CHARACTERID asc limit 1; 
	select CHARACTERID into @CHARACTERID from character_data where PLAYERUID = _PLAYERUID order by CHARACTERID desc limit 1; 
	update character_data set INVENTORY = @INVENTORY, BACKPACK = @BACKPACK where CHARACTERID = @CHARACTERID;
    if _TELEPORT = 1 then
        update character_data set WORLDSPACE = @WORLDSPACE where CHARACTERID = @CHARACTERID;
    end if;
    if _MODEL = 1 then
        update character_data set MODEL = @MODEL where CHARACTERID = @CHARACTERID;
    end if;
	select * from character_data where CHARACTERID = @CHARACTERID;
end//
delimiter ;

drop procedure if exists p_teleport;
delimiter //
create procedure p_teleport(in _PLAYERUID text, in _WORLDSPACE text)
comment 'Transfers all alive characters from one playeruid to a worldspace.'
begin
    update character_data set WORLDSPACE = _WORLDSPACE where PLAYERUID = _PLAYERUID and ALIVE = 1;
	select * from character_data where PLAYERUID = _PLAYERUID and ALIVE = 1;
end//
delimiter ;

/*####### FUNCTIONS BELOW ARE USED TO LOOK UP INFORMATION #######*/
drop procedure if exists p_view_expired_buildables;
delimiter //
create procedure p_view_expired_buildables(in _DAYS int, in _DELETE int)
comment 'looks up a list of expired buildables based on days since owners last login'
begin
    select * from v_object_data where datediff(now(),PLAYERLASTLOGIN) >= _DAYS and CATEGORY = "DEPLOYABLE" and PLAYERUID not in ("147943494","155036742") order by PLAYERLASTLOGIN;
        
    if _DELETE = 1 then
        drop temporary table if exists tt_objectid;
        create temporary table tt_objectid as select OBJECTID from v_object_data where datediff(now(),PLAYERLASTLOGIN) >= _DAYS and CATEGORY = "DEPLOYABLE" and PLAYERUID not in ("147943494","155036742");
        insert ignore into t_deleted_objects select a.* from Object_DATA a inner join tt_objectid b on a.OBJECTID = b.OBJECTID;
        delete a.* from Object_DATA a inner join tt_objectid b on a.OBJECTID = b.OBJECTID;
    end if;
end//
delimiter ;

drop procedure if exists p_view_expired_vehicles;
delimiter //
create procedure p_view_expired_vehicles(in _DAYS int, in _DELETE int)
comment 'looks up a list of expired vehicles based on days since it was accessed'
begin
    select * from v_object_data where datediff(now(),LASTUPDATED) >= _DAYS and CATEGORY = "VEHICLE" and OINVENTORY in ("[[[],[]],[[],[]],[[],[]]]","[]")
    union all
    select * from v_object_data where datediff(now(),LASTUPDATED) >= (_DAYS * 2) and CATEGORY = "VEHICLE"
    order by LASTUPDATED;
        
    if _DELETE = 1 then
        drop temporary table if exists tt_objectid;
        create temporary table tt_objectid as select OBJECTID from v_object_data where datediff(now(),LASTUPDATED) >= _DAYS and CATEGORY = "VEHICLE" and OINVENTORY in ("[[[],[]],[[],[]],[[],[]]]","[]") order by LASTUPDATED;
        insert ignore into t_deleted_objects select a.* from Object_DATA a inner join tt_objectid b on a.OBJECTID = b.OBJECTID;
        delete a.* from Object_DATA a inner join tt_objectid b on a.OBJECTID = b.OBJECTID;
        drop temporary table if exists tt_objectid;
        create temporary table tt_objectid as select OBJECTID from v_object_data where datediff(now(),LASTUPDATED) >= (_DAYS * 2) and CATEGORY = "VEHICLE" order by LASTUPDATED;
        insert ignore into t_deleted_objects select a.* from Object_DATA a inner join tt_objectid b on a.OBJECTID = b.OBJECTID;
        delete a.* from Object_DATA a inner join tt_objectid b on a.OBJECTID = b.OBJECTID;
    end if;
end//
delimiter ;


drop procedure if exists p_lookup_playeruid;
delimiter //
create procedure p_lookup_playeruid(in _PLAYERNAME text)
comment 'looks up a list of playeruids based on partial name'
begin
    select * from v_player_data where lower(PLAYERNAME) like concat("%",lower(_PLAYERNAME),"%");
end//
delimiter ;

drop procedure if exists p_lookup_player;
delimiter //
create procedure p_lookup_player(in _CHARACTERID text)
comment 'shows the player info of a given characterid'
begin
    select * from v_character_data where CHARACTERID = _CHARACTERID;
end//
delimiter ;

drop procedure if exists p_lookup_characters;
delimiter //
create procedure p_lookup_characters(in _PLAYERUID text)
comment 'shows a list of characters created by a given playeruid'
begin
    select * from v_character_data where PLAYERUID = _PLAYERUID;
end//
delimiter ;

drop procedure if exists p_lookup_objects;
delimiter //
create procedure p_lookup_objects(in _PLAYERUID text)
comment 'shows a list of objects built by a given playeruid'
begin
    select min(DATESTAMP) into @PLAYERFIRSTLOGIN from player_login where PLAYERUID = _PLAYERUID;
    select max(DATESTAMP) into @PLAYERLASTLOGIN  from player_login where PLAYERUID = _PLAYERUID;
	select  a.PLAYERUID, 
            a.PLAYERNAME,
            @PLAYERFIRSTLOGIN as PLAYERFIRSTLOGIN,
            @PLAYERLASTLOGIN  as PLAYERLASTLOGIN,
            c.OBJECTID,
            c.DATESTAMP as CREATEDATE,
            c.CLASSNAME,
            c.WORLDSPACE
    from       player_data       a
    inner join character_data    b on a.PLAYERUID   = b.PLAYERUID
    inner join object_data       c on b.CHARACTERID = c.CHARACTERID
    where a.PLAYERUID = _PLAYERUID and c.FUEL = 0 and c.DAMAGE = 0
    order by CREATEDATE desc;
end//
delimiter ;

drop procedure if exists p_wipe_data;
delimiter //
create procedure p_wipe_data(in _PASSWORD text)
comment 'wipes ALL DATA from the database - USE WITH CAUTION'
begin
    if _PASSWORD = "DELETE" then
        drop table if exists bkCharacter_DATA;
        create table bkCharacter_DATA as select * from Character_DATA;
        truncate table Character_DATA;
        drop table if exists bkObject_DATA;
        create table bkObject_DATA as select * from Object_DATA;
        truncate table Object_DATA;
        drop table if exists bkPlayer_DATA;
        create table bkPlayer_DATA as select * from Player_DATA;
        truncate table Player_DATA;
        drop table if exists bkPlayer_LOGIN;
        create table bkPlayer_LOGIN as select * from Player_LOGIN;
        truncate table Player_LOGIN;
    end if;
end//
delimiter ;

drop procedure if exists p_restore_data;
delimiter //
create procedure p_restore_data(in _PASSWORD text)
comment 'restores ALL DATA from the backup tables to the database - USE WITH CAUTION'
begin
    if _PASSWORD = "DELETE" then
        truncate table Character_DATA;
        insert into Character_DATA select * from bkCharacter_DATA;
        truncate table Object_DATA;
        insert into Object_DATA select * from bkObject_DATA;
        truncate table Player_DATA;
        insert into Player_DATA select * from bkPlayer_DATA;
        truncate table Player_LOGIN;
        insert into Player_LOGIN select * from bkPlayer_LOGIN;
    end if;
end//
delimiter ;