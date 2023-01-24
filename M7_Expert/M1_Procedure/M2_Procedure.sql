/*
Procedure
*/

create or replace procedure pr_buy_prducts()
begin
	declare v_product_name varchar(100);
	declare v_price int;

	select productname,price
	into v_product_name,v_price
	from Productv1
	where productname="MacBookPro13";

	insert into Salesv1 ( Store_id,product,cost )
	values (11,v_product_name,v_price);
	
end


call pr_buy_prducts(); 



create or replace procedure pr_buy_prducts()
begin
	declare v_product_name varchar(100);
	declare v_price int;

	set @v_price_1:=100;

	select productname,price
	into v_product_name,v_price
	from Productv1
	where productname="MacBookPro13";

	insert into Salesv1 ( Store_id,product,cost )
	values (11,v_product_name,v_price);
	
end


call pr_buy_prducts(); 




-- With Parameters

create procedure pr_buy_prducts(p_prkduct_name varchar(100),p_price int)
begin
	declare v_product_name varchar(100);
	declare v_price int;

	select productname,price
	into v_product_name,p_price
	from Productv1
	where productname="MacBookPro13";

	insert into Salesv1 ( Store_id,product,cost )
	values (11,v_product_name,v_price);
	
end



call pr_buy_prducts1("MacBookPro13",100000);

