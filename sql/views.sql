drop view if exists v_object_class;
create algorithm=MERGE view v_object_class as 
select count(*) as COUNT,
       a.CLASSNAME,
       (case when (sum(a.FUEL) > 0 or sum(a.DAMAGE) > 0) then 'VEHICLE' 
             when (a.CLASSNAME in (
                    'VaultStorageLocked',
                    'Land_DZE_GarageWoodDoorLocked',
                    'Land_DZE_LargeWoodDoorLocked',
                    'LockboxStorageLocked',
                    'CinderWallDoorSmallLocked_DZ',
                    'Land_DZE_WoodDoorLocked',
                    'CinderWallDoorLocked_DZ'))          then 'LOCKABLE' 
             else                                             'DEPLOYABLE' 
        end) as CATEGORY 
from object_data a 
group by a.CLASSNAME 
order by COUNT desc;

drop view if exists v_playerfirstlogin;
create algorithm=MERGE view v_playerfirstlogin as select PLAYERUID, min(DATESTAMP) as PLAYERFIRSTLOGIN from player_login group by PLAYERUID order by PLAYERFIRSTLOGIN asc;

drop view if exists v_playerlastlogin;
create algorithm=MERGE view v_playerlastlogin as select PLAYERUID, max(DATESTAMP) as PLAYERLASTLOGIN from player_login group by PLAYERUID order by PLAYERLASTLOGIN desc;

drop view if exists v_player_data;
create algorithm=TEMPTABLE view v_player_data as 
select a.PLAYERUID,
       a.PLAYERNAME,
       b.PLAYERFIRSTLOGIN,
       c.PLAYERLASTLOGIN
from       player_data        a
inner join v_playerfirstlogin b on a.PLAYERUID = b.PLAYERUID
inner join v_playerlastlogin  c on a.PLAYERUID = c.PLAYERUID
order by PLAYERLASTLOGIN desc;

drop view if exists v_character_data;
create algorithm=TEMPTABLE view v_character_data as 
select a.*,
       b.CHARACTERID,
       b.DATESTAMP as CREATEDATE,
       b.LASTLOGIN,
       b.ALIVE,
       b.INVENTORY,
       b.BACKPACK,
       b.MODEL,
       b.WORLDSPACE
from       v_player_data  a
inner join character_data b on a.PLAYERUID = b.PLAYERUID
order by PLAYERLASTLOGIN desc, CHARACTERID desc;

drop view if exists v_playeruid_to_characterid;
create algorithm=MERGE view v_playeruid_to_characterid as
select PLAYERUID, CHARACTERID from character_data union all select PLAYERUID, CHARACTERID from t_deleted_characters;

drop view if exists v_object_data;
create algorithm=TEMPTABLE view v_object_data as 
select a.OBJECTID,
       b.CATEGORY,
       (case when b.CATEGORY = 'DEPLOYABLE' then c.PLAYERUID end) as PLAYERUID,
       a.CHARACTERID,
       a.CLASSNAME,
       a.DATESTAMP   as CREATEDATE,
       a.LASTUPDATED as UPDATEDATE,
       a.WORLDSPACE,
       a.INVENTORY,
       a.FUEL,
       a.DAMAGE
from      object_data                a 
join      v_object_class             b on a.CLASSNAME   = b.CLASSNAME
left join v_playeruid_to_characterid c on a.CHARACTERID = c.CHARACTERID
order by CREATEDATE desc;
