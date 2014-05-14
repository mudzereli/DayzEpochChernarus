CREATE EVENT `e_update_quantities`
	ON SCHEDULE
		EVERY 3 HOUR STARTS '2014-05-14 08:45:18'
	ON COMPLETION PRESERVE
	ENABLE
	COMMENT 'update qtys to more of a rare item system (except building supplies)'
	DO BEGIN
	UPDATE Traders_DATA SET QTY = FLOOR(RAND() * 2);
	UPDATE Traders_DATA SET QTY = FLOOR(RAND() * 2) WHERE QTY > 0;
	UPDATE Traders_DATA SET QTY = 9999 WHERE tid in (508,530,662,555,636,675);
END