SELECT 'This update may make changes that require SUPER privileges. If you see an error message saying:

ERROR 1419 (HY000) at line 298: You do not have the SUPER privilege and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)

You will have to either run this update as root manually using something like (on ubuntu/debian)

sudo mysql --defaults-file=/etc/mysql/debian.cnf zm < /usr/share/zoneminder/db/zm_update-1.35.24.sql

OR

sudo mysql --defaults-file=/etc/mysql/debian.cnf "set global log_bin_trust_function_creators=1;"
sudo zmupdate.pl

OR

Turn off binary logging in your mysql server by adding this to your mysql config.
[mysqld]
skip-log-bin

';

SET @s = (SELECT IF(
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema = DATABASE()
      AND table_name = 'Event_Summaries'
    ) > 0
    ,
    "SELECT 'Event_Summaries Already exists'",
    "
    CREATE TABLE `Event_Summaries` (
  `MonitorId` int(10) unsigned NOT NULL,
  `TotalEvents` int(10) default NULL,
  `TotalEventDiskSpace` bigint default NULL,
  `HourEvents` int(10) default NULL,
  `HourEventDiskSpace` bigint default NULL,
  `DayEvents` int(10) default NULL,
  `DayEventDiskSpace` bigint default NULL,
  `WeekEvents` int(10) default NULL,
  `WeekEventDiskSpace` bigint default NULL,
  `MonthEvents` int(10) default NULL,
  `MonthEventDiskSpace` bigint default NULL,
  `ArchivedEvents` int(10) default NULL,
  `ArchivedEventDiskSpace` bigint default NULL,
  PRIMARY KEY (`MonitorId`)
) ENGINE=InnoDb;
"
    ));

PREPARE stmt FROM @s;
EXECUTE stmt;

DELETE FROM Event_Summaries;

REPLACE INTO Event_Summaries
  SELECT  MonitorId,
    COUNT(Id) AS TotalEvents,
    SUM(DiskSpace) AS TotalEventDiskSpace,
    SUM(IF(StartDateTime > DATE_SUB(NOW(), INTERVAL 1 hour),1,0)) AS HourEvents,
    SUM(IF(StartDateTime > DATE_SUB(NOW(), INTERVAL 1 hour),DiskSpace,0)) AS HourEventDiskSpace,
    SUM(IF(StartDateTime > DATE_SUB(NOW(), INTERVAL 1 day),1,0)) AS DayEvents,
    SUM(IF(StartDateTime > DATE_SUB(NOW(), INTERVAL 1 day),DiskSpace,0)) AS DayEventDiskSpace,
    SUM(IF(StartDateTime > DATE_SUB(NOW(), INTERVAL 1 week),1,0)) AS WeekEvents,
    SUM(IF(StartDateTime > DATE_SUB(NOW(), INTERVAL 1 week),DiskSpace,0)) AS WeekEventDiskSpace,
    SUM(IF(StartDateTime > DATE_SUB(NOW(), INTERVAL 1 month),1,0)) AS MonthEvents,
    SUM(IF(StartDateTime > DATE_SUB(NOW(), INTERVAL 1 month),DiskSpace,0)) AS MonthEventDiskSpace,
    SUM(IF(Archived,1,0)) AS ArchivedEvents,
    SUM(IF(Archived,DiskSpace,0)) AS ArchivedEventDiskSpace
    FROM Events GROUP BY MonitorId;
   
source /usr/share/zoneminder/db/triggers.sql
