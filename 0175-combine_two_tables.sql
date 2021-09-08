# Write your MySQL query statement below
SELECT FirstName, LastName, Address.City, Address.State FROM Person
LEFT OUTER JOIN Address on Person.PersonID = Address.PersonId