
select count(*) from Oceny

select top 100 * from Oceny

--Table 'Oceny'. Scan count 1, logical reads 3236,
set statistics io on
select * from Oceny where id=100
set statistics io off

--Table 'Oceny'. Scan count 1, logical reads 3,
create nonclustered index NoclustIndex on Oceny(Id) 
set statistics io on
select * from Oceny where id=100
set statistics io off
drop index NoclustIndex on Oceny(Id) 

--Table 'Oceny'. Scan count 1, logical reads 4, 0.0000s
create clustered index TrueclustIndex on Oceny(Klucz) 
set statistics io on
select * from Oceny where Klucz='KLqVnamK5UzcMytDDzg1HQ77Py2zgfliePn1WMc3UpWKfdndUUYjfes1mFdOrooeJmZutAwVOhYkltg5g4VtwdODOiWK0HSoto0psm0Cw9jNAtiFtyHrHiMe91KQNrO7Lg1aFiawo3zn4ywRUmLl9mdKKCcj6n8yzU0s3xNJp2Ya7CwyRMBPpaMZLybKVlKf2XcWtVHg'
set statistics io off

--Table 'Oceny'. Scan count 1, logical reads 3236, 0.014s
drop index TrueclustIndex on Oceny
set statistics io on
select * from Oceny where Klucz='KLqVnamK5UzcMytDDzg1HQ77Py2zgfliePn1WMc3UpWKfdndUUYjfes1mFdOrooeJmZutAwVOhYkltg5g4VtwdODOiWK0HSoto0psm0Cw9jNAtiFtyHrHiMe91KQNrO7Lg1aFiawo3zn4ywRUmLl9mdKKCcj6n8yzU0s3xNJp2Ya7CwyRMBPpaMZLybKVlKf2XcWtVHg'
set statistics io off