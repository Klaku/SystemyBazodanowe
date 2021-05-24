
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
drop index NoclustIndex on Oceny

--Table 'Oceny'. Scan count 1, logical reads 4, 0.0000s
create clustered index TrueclustIndex on Oceny(Klucz) 
set statistics io on
select * from Oceny where Klucz='QVD7f9Ul6xFOru2uqW8R83k5sx4KRecqbhCJWMrN7m5mnDk3eAsWWkd9BTIPO9MGrk4Bda0ZlchFdFfJOdaFm5SjAyd2ZBVRDx8uAw2YvAxFEVzkuSCyLpmPyysCjXuXMAiAYeSEmLsMRs18ynZAGBInUVEF64RHgT0s7QM1vb3MBMbVf7Fiab0Wr9GwtyvwwYG3sYb1YR4Tr1Zdi4TYo2eyKUH9vM4zxSsV93cS4mnGqTB6xeHfV5waHUQ1Tcwal9pjUbKhdWWAz6ofwnCw3ikECgIwWCDFHVNXy4oGUpCKGierYJ9sPGc4vi1JC1zFycPggy3EYkpPDMz4y5ObqeR1aXRGynm6CXkYyb1BowIR83psxpTb9EzNS9MRUSiPUJzTx1vutao'
set statistics io off

--Table 'Oceny'. Scan count 1, logical reads 3236, 0.014s
drop index TrueclustIndex on Oceny
set statistics io on
select * from Oceny where Klucz='QVD7f9Ul6xFOru2uqW8R83k5sx4KRecqbhCJWMrN7m5mnDk3eAsWWkd9BTIPO9MGrk4Bda0ZlchFdFfJOdaFm5SjAyd2ZBVRDx8uAw2YvAxFEVzkuSCyLpmPyysCjXuXMAiAYeSEmLsMRs18ynZAGBInUVEF64RHgT0s7QM1vb3MBMbVf7Fiab0Wr9GwtyvwwYG3sYb1YR4Tr1Zdi4TYo2eyKUH9vM4zxSsV93cS4mnGqTB6xeHfV5waHUQ1Tcwal9pjUbKhdWWAz6ofwnCw3ikECgIwWCDFHVNXy4oGUpCKGierYJ9sPGc4vi1JC1zFycPggy3EYkpPDMz4y5ObqeR1aXRGynm6CXkYyb1BowIR83psxpTb9EzNS9MRUSiPUJzTx1vutao'
set statistics io off