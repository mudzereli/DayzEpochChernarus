drop view if exists v_object_class;
create view v_object_class as 
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