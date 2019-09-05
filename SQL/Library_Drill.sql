CREATE DATABASE Library_System;
USE Library_System;

CREATE TABLE tbl_Library_Branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(100) NOT NULL
	);
INSERT INTO tbl_Library_Branch
	 ( BranchName, Address)
	  VALUES
	 ('Sharpstown', '101 North Green St Portland Oregon 97217'),
	  ('Central', '7107 North Hiland Ave Portland Oregon 97213'),
	  ('Downtown', '5555 SW Flanders St Portland Oregon 97241'),
	  ('East Side' , '675 East Flowers Dt, Portland Oregon 97645')
	  ;

	SELECT * FROM tbl_Library_Branch
	Select* from tbl_Books

   
  CREATE TABLE tbl_Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(50) NOT NULL
	);
 INSERT INTO tbl_Publisher
	( PublisherName, Address, Phone)
	VALUES
	('Harper Collins', '555 5th Ave NY NY 75647', '1-800-564-5567'),
	('Simone & Schuster', '564 6th Ave NY NY 75647', '1-800-675-8998'),
	('Wiley', '875 &th Ave NY NY 75647', '1-800=9732-3456')
	;




	 
	 
 CREATE TABLE tbl_Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (300,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(100) Not NULL,
	Phone VARCHAR(50) NOT NULL
	);





CREATE TABLE tbl_Books (
  BookID INT PRIMARY KEY NOT NULL IDENTITY(500,1),
  Title VARCHAR(100) NOT NULL,
  Books_PublisherName VARCHAR(50) NOT NULL CONSTRAINT FK__PublisherName FOREIGN KEY REFERENCES tbl_Publisher(PublisherName) on UPDATE CASCADE ON DELETE CASCADE
  );
INSERT INTO tbl_Books
  (Title, Books_PublisherName)
  VALUES
	('The Lost Tribe', 'Harper Collins'),
	('The Shining', 'Harper Collins'),
	('Stand By Me', 'Simon & Schuster'),
	('Their Eyes Were Wathcing God', 'Simon & Schuster'),
	('Of Mice and Men', 'Harper Collins'),
	('The Bell Jar', 'Wiley'),
	('The Color Purple', 'Wiley'),
	('Still Life With Woodpecker', 'Wiley'),
	('On The Road', 'Harper Collins'),
	('The Old Man and the Sea', 'Harper Collins'),
	('Inner Sex', 'Wiley'),
	('The Great Gatsby', 'Simon & Schuster'),
	('To Kill a Mockingbird', 'Simon & Schuster'),
	('The Alchemist', 'Wiley'),
	('The Grapes of Wrath', 'Harper Collins'),
	('Lord of the Flies', 'Wiley'),
	('The Outsiders', 'Harper Collins')
	;

	SELECT * FROM tbl_Book_Authors

Create Table tbl_Book_Authors (
	Book_Authors_BookID  INT NOT NULL CONSTRAINT FK_Book_Authors__BookID FOREIGN KEY REFERENCES tbl_Books(BookID) on UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
	);

INSERT INTO tbl_Book_Authors
	(Book_Authors_BookID, AuthorName)
	VALUES
	(500, 'Mark Lee'),
	(501, 'Stephen King'),
	(502, 'Stephen King'),
	(503, 'Zora Neil Hurston'),
	(504, 'John Steinbeck'),
	(505, 'Sylvia Plath'),
	(506, 'Alice Walker'),
	(507, 'Tom Robbins'),
	(508, 'Jack Kerouac'),
	(509, 'John Hemingway'),
	(510, 'Jeffrey Eugenides'),
	(511, 'F Scott  Fitzgerald'),
	(512, 'Harper Lee'),
	(513,'Paulo Coelo'),
	(514, 'John Steinbeck'),
	(515, 'William Golding'),
	(516, 'S.E. Hinton')
	;

CREATE TABLE tbl_Copies (
	Copies_BookID  INT NOT NULL CONSTRAINT FK_Copies__BookID FOREIGN KEY REFERENCES tbl_Books(BookID) on UPDATE CASCADE ON DELETE CASCADE,
	Copies_branch_id INT NOT NULL CONSTRAINT FK_Copies__branch_id FOREIGN KEY REFERENCES tbl_Library_Branch(branch_id) on UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies Int NOT NULL
	);

	INSERT INTO tbl_Copies
	 (Copies_BookID , Copies_branch_id, Number_Of_Copies)
	 VALUES
	 (500, 1, 2),
	 (503, 1, 2),
	 (507, 1, 2),
	 (509, 1, 3),
	 (510, 1, 2),
	 (512, 1, 2),
	 (513, 1, 3),
	 (514, 1, 2),
	 (515, 1, 4),
	 (516, 1, 2),
	 (501, 2, 2),
	 (502, 2, 2),
	 (503, 2, 2),
	 (504, 2, 3),
	 (505, 2, 2),
	 (506, 2, 2),
	 (507, 2, 3),
	 (508, 2, 4),
	 (509, 2, 3),
	 (515, 2, 5),
	 (500, 3, 3),
	 (501, 3, 2),
	 (502, 3, 3),
	 (504, 3, 2),
	 (506, 3, 5),
	 (509, 3, 4),
	 (512, 3, 3),
	 (514, 3, 3),
	 (515, 3, 2),
	 (516, 3, 2),
	 (501, 4, 2),
	 (503, 4, 2),
	 (504, 4, 5),
	 (505, 4, 3),
	 (507, 4, 4),
	 (509, 4, 6),
	 (510, 4, 3),
	 (513, 4, 2),
	 (514, 4, 5),
	 (516, 4, 4)
	 ;

CREATE TABLE tbl_Book_Loans (
	 Book_Loans_BookID INT NOT NULL CONSTRAINT FK_Loans_BookID FOREIGN KEY REFERENCES tbl_Books(BookID) on UPDATE CASCADE ON DELETE CASCADE, 
	 Book_Loans_branch_id INT NOT NULL CONSTRAINT FK_Loans_BranchID FOREIGN KEY REFERENCES tbl_Library_Branch(branch_id) on UPDATE CASCADE ON DELETE CASCADE, 
	 Book_Loans_CardNo INT NOT NULL CONSTRAINT FK_Loans_CardNo FOREIGN KEY REFERENCES tbl_Borrower(CardNo) on UPDATE CASCADE ON DELETE CASCADE, 
	 DateOut VARCHAR(50) NOT NULL,
	 DateIN VARCHAR(50) NOT NULL
	 );
INSERT INTO tbl_Book_Loans
(Book_Loans_BookID, Book_Loans_branch_id, Book_Loans_CardNo, DateOut, DateIn)
VALUES
(500, 1, 302, '08/01/2019','08/14/2019'),
(501, 1, 302, '08/01/2019', '08/14/2019'),
(505, 1, 302, '08/01/2019', '08/14/2019'),
(506, 1, 302, '08/01/2019', '08/14/2019'),
(507, 1, 302, '08/01/2019', '08/14/2019'),
(509, 2,  303, '08/04/2019', '08/20/2019'),
(504, 2, 303, '08/04/2019', '08/20/2019'),
(511, 2, 303, '08/04/2019', '08/20/2019'),
(512, 2,  303, '08/04/2019', '08/20/2019'),
(514, 2, 303, '08/04/2019', '08/20/2019'),
(516, 2, 303, '08/04/2019', '08/20/2019'),
(500, 3, 304, '08/11/2019', '08/22/2019'),
(501, 3, 304, '08/11/2019', '08/22/2019'),
(510, 3, 305, '08/11/2019', '08/22/2019'),
(512, 3, 306, '08/11/2019', '08/22/2019'),
(513, 3, 307, '08/11/2019', '08/22/2019'),
(516, 4, 308, '08/11/2019', '08/22/2019'),
(500, 4, 309, '08/11/2019', '08/22/2019'),
(508, 4, 309, '08/11/2019', '08/22/2019')
;
-- Drill 1
SELECT BranchName, Title, Number_Of_Copies from tbl_Books inner join tbl_Copies on tbl_Copies.Copies_BookID = tbl_Books.BookID

inner join tbl_Library_Branch on tbl_Library_Branch.branch_id = tbl_Copies.Copies_branch_id
 
where Title = 'The Lost Tribe' and BranchName = 'Sharpstown'



--Drill 2
SELECT Number_OF_Copies, Title, BranchName from tbl_Books
inner join tbl_Copies on tbl_Copies.Copies_BookID = tbl_Books.BookID
inner join tbl_Library_Branch on tbl_Library_Branch.branch_id = tbl_Copies.Copies_branch_id
 where Title = 'The Lost Tribe' 



--Drill 3
 SELECT Name, DateOut from tbl_Borrower
full outer join tbl_Book_Loans on tbl_Book_Loans.Book_Loans_CardNo = tbl_Borrower.CardNo



--Drill 4
 Select Title, Name, tbl_Borrower.Address, BranchName, DateIN from tbl_Borrower
 inner join tbl_Book_Loans on tbl_Book_Loans.Book_Loans_CardNo = tbl_Borrower.CardNo
 inner join tbl_Library_Branch on tbl_Library_Branch.branch_id = tbl_Book_Loans.Book_Loans_branch_id
 inner join tbl_Books on tbl_Books.BookID = tbl_Book_Loans.Book_Loans_BookID
 where BranchName = 'Sharpstown' and DateIn = '08/14/2019'


 --Drill 5
 Select tbl_Library_Branch.BranchName, COUNT(tbl_Book_Loans.Book_Loans_BookID) AS NumberOFBooks from tbl_Book_Loans
 inner Join tbl_Library_Branch on tbl_Book_Loans.Book_Loans_branch_id = tbl_Library_Branch.branch_id
 Group by BranchName





 --Drill 6
SELECT  tbl_Borrower.Name, Address,COUNT(tbl_Book_Loans.Book_Loans_BookID) As NumberOfCopies
FROM (tbl_Book_Loans
INNER jOIN tbl_Borrower on tbl_Book_Loans.Book_Loans_CardNo = tbl_Borrower.CardNo)
Group by tbl_Borrower.Name,Address
HAVING COUNT(tbl_Book_Loans.Book_Loans_BookID) > 5;





 --Drill 7
 SELECT Title,Number_Of_Copies,AuthorName, BranchName  from tbl_Library_Branch
 inner join tbl_Copies on tbl_Library_Branch.branch_id = tbl_Copies.Copies_branch_id
 inner join tbl_Books on tbl_Copies.Copies_BookID = tbl_Books.BookID
 inner join tbl_Book_Authors on tbl_Books.BookID = tbl_Book_Authors.Book_Authors_BookID
 Where AuthorName = 'Stephen King' and BranchName = 'Central' 






select * from tbl_Borrower


Select * from tbl_Book_Authors
Select * from tbl_Books
Select * from tbl_Library_Branch
Select * from tbl_Book_Loans
Select * from tbl_Copies