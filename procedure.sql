create procedure deletePlayer(
in steamId varchar(250)
)
begin
update owned_shops set identifier = 0, `ShopName` = 0  where identifier = steamId;
update user_inventory set count = 0 where identifier = steamId;
delete from user_inventory where identifier = steamId;
delete from addon_account_data where owner = steamId;
delete from billing where identifier = steamId;
delete from datastore_data where owner = steamId;
delete from owned_properties where owner = steamId;
delete from phone_users_contacts where identifier = steamId;
delete from phone_calls where owner = (select phone_number from users where identifier = steamId);
delete from user_documents where owner = steamId;
delete from user_licenses where owner = steamId;
delete from playerstattoos where identifier = steamId;
delete from owned_vehicles where owner = steamId;
delete from user_accounts where identifier = steamId;
delete from users where identifier = steamId;
delete from `characters` where identifier = steamId;
end;
