SELECT CONCAT("A purchase with the ID of ", o.purchaseid, " is an online purchase of type ",
o.onlinetype, " and also a walkin purchase of location ", w.shoplocation) AS Verification
FROM onlinepurchase o JOIN walkinpurchase w
			ON o.purchaseID = w.purchaseID;
			