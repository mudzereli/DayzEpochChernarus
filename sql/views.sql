drop function if exists split_str;
create function split_str(
  x varchar(255),
  delim varchar(12),
  pos int
)
returns varchar(255)
return replace(substring(substring_index(x, delim, pos),
       length(substring_index(x, delim, pos -1)) + 1),
       delim, '');
       
drop view if exists v_object_class;
create view v_object_class as 
select count(*) as COUNT,
       a.CLASSNAME,
       (case when (sum(a.FUEL) > 0 or sum(a.DAMAGE) > 0) then 'VEHICLE' 
             when (a.CLASSNAME like "%Locked%")          then 'LOCKABLE' 
             else                                             'DEPLOYABLE' 
        end) as CATEGORY 
from Object_DATA a 
group by a.CLASSNAME 
order by COUNT desc;

drop view if exists v_player_data;
create view v_player_data as 
select a.PLAYERUID,
       a.PLAYERNAME,
       max(b.DATESTAMP) as PLAYERLASTLOGIN,
       min(b.DATESTAMP) as PLAYERFIRSTLOGIN
from       Player_DATA  a
inner join Player_LOGIN b on a.PLAYERUID = b.PLAYERUID
group by a.PLAYERUID
order by PLAYERLASTLOGIN desc;

drop view if exists v_character_data;
create view v_character_data as 
select a.*,
       b.CHARACTERID,
       b.DATESTAMP as CREATEDATE,
       b.ALIVE,
       b.INVENTORY,
       b.BACKPACK,
       b.MODEL,
       b.WORLDSPACE
from       v_player_data  a
inner join Character_DATA b on a.PLAYERUID = b.PLAYERUID
order by PLAYERLASTLOGIN desc, CHARACTERID desc;

drop view if exists v_object_data;
create view v_object_data as 
select a.OBJECTID,
       a.DATESTAMP as BUILTDATE,
       b.CATEGORY,
       a.CLASSNAME,
       a.INVENTORY as OINVENTORY,
       cast(replace(split_str(a.WORLDSPACE,",",1),"[" ,"") as DECIMAL(10,2)) as WORLD_DIR,
       cast(replace(split_str(a.WORLDSPACE,",",2),"[" ,"") as DECIMAL(10,2)) as WORLD_X,
       cast(split_str(a.WORLDSPACE,",",3)                  as DECIMAL(10,2)) as WORLD_Y,
       cast(replace(split_str(a.WORLDSPACE,",",4),"]]","") as DECIMAL(10,2)) as WORLD_Z,
       a.WORLDSPACE as OWORLDSPACE,
       a.LASTUPDATED,
       c.*
from       Object_DATA      a
inner join v_object_class   b on a.CLASSNAME   = b.CLASSNAME
left  join v_character_data c on a.CHARACTERID = c.CHARACTERID and b.CATEGORY = "DEPLOYABLE" and c.PLAYERUID not in ("147943494","155036742")
order by BUILTDATE desc;