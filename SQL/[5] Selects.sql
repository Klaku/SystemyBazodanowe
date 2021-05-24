-- Policz użytkowników z nazwiskiem na K w każdym mieście
Select Miasto,Count(*) as 'K surname count' from Users where Nazwisko like 'K%' Group BY Miasto

--Pokaż Stanowiska z ilością obsadzeń większą niż 5
Select Rola.Stanowisko,Count(Rola.Id) from Rola join Roles on Rola.Id = Roles.Rola_Id group by Rola.Stanowisko having Count(Roles.User_Id) > 5 

-- Posortuj przedmioty po ECTS
Select * from Przedmiot order by Przedmiot.ects desc