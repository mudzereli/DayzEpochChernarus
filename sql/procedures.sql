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

/*####### FUNCTIONS BELOW ARE USED TO LOOK UP INFORMATION #######*/
drop procedure if exists p_lookup_playeruid;
delimiter //
create procedure p_lookup_playeruid(in _PLAYERNAME text)
comment 'looks up a list of playeruids based on partial name'
begin
    select a.PLAYERUID,
           a.PLAYERNAME,
           max(b.DATESTAMP) as PLAYERLASTLOGIN,
           min(b.DATESTAMP) as PLAYERFIRSTLOGIN
    from       player_data  a
    inner join player_login b on a.PLAYERUID = b.PLAYERUID
    where lower(a.PLAYERNAME) like concat("%",lower(_PLAYERNAME),"%")
    group by a.PLAYERUID 
    order by PLAYERLASTLOGIN desc;
end//
delimiter ;

drop procedure if exists p_lookup_player;
delimiter //
create procedure p_lookup_player(in _CHARACTERID text)
comment 'shows the player info of a given characterid'
begin
    select a.PLAYERUID,
           a.PLAYERNAME,
           max(b.DATESTAMP) as PLAYERLASTLOGIN,
           min(b.DATESTAMP) as PLAYERFIRSTLOGIN,
           c.CHARACTERID,
           c.DATESTAMP as CREATEDATE,
           c.ALIVE,
           c.INVENTORY,
           c.BACKPACK,
           c.MODEL,
           c.WORLDSPACE
    from       player_data    a
    inner join player_login   b on a.PLAYERUID = b.PLAYERUID
    inner join character_data c on a.PLAYERUID = c.PLAYERUID
    where c.CHARACTERID = _CHARACTERID
    group by a.PLAYERUID 
    order by PLAYERLASTLOGIN desc;
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

drop procedure if exists p_lookup_characters;
delimiter //
create procedure p_lookup_characters(in _PLAYERUID text)
comment 'shows a list of characters created by a given playeruid'
begin
    select min(DATESTAMP) into @PLAYERFIRSTLOGIN from player_login where PLAYERUID = _PLAYERUID;
    select max(DATESTAMP) into @PLAYERLASTLOGIN  from player_login where PLAYERUID = _PLAYERUID;
	select  a.PLAYERUID, 
            a.PLAYERNAME,
            @PLAYERFIRSTLOGIN as PLAYERFIRSTLOGIN,
            @PLAYERLASTLOGIN  as PLAYERLASTLOGIN,
            b.CHARACTERID,
            b.DATESTAMP as CREATEDATE,
            b.ALIVE,
            b.INVENTORY,
            b.BACKPACK,
            b.MODEL,
            b.WORLDSPACE
    from       player_data       a
    inner join character_data    b on a.PLAYERUID   = b.PLAYERUID
    where a.PLAYERUID = _PLAYERUID
    order by b.CHARACTERID desc;
end//
delimiter ;