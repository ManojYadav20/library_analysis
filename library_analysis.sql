create database library;
use library;
-- Table: tbl_publisher
CREATE TABLE tbl_publisher (
    publisher_PublisherName VARCHAR(255) PRIMARY KEY,
    publisher_PublisherAddress TEXT,
    publisher_PublisherPhone VARCHAR(15)
);
select * from tbl_publisher;
select count(*) from tbl_publisher;


-- Table: tbl_book
CREATE TABLE tbl_book (
    book_BookID INT PRIMARY KEY,
    book_Title VARCHAR(255),
    book_PublisherName VARCHAR(255),
    FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName)
);
select * from tbl_book;
select count(*) from tbl_book;


-- Table: tbl_book_authors
CREATE TABLE tbl_book_authors (
    book_authors_AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    book_authors_BookID INT,
    book_authors_AuthorName VARCHAR(255),
    FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID)
);
select * from tbl_book_authors;
select count(*) from tbl_book_authors;


-- Table: tbl_library_branch
CREATE TABLE tbl_library_branch (
    library_branch_BranchID INT PRIMARY KEY AUTO_INCREMENT,
    library_branch_BranchName VARCHAR(255),
    library_branch_BranchAddress TEXT
);
select * from tbl_library_branch;
select count(*) from tbl_library_branch;


-- Table: tbl_book_copies
CREATE TABLE tbl_book_copies (
    book_copies_CopiesID INT PRIMARY KEY AUTO_INCREMENT,
    book_copies_BookID INT,
    book_copies_BranchID INT,
    book_copies_No_Of_Copies INT,
    FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID)
);
select * from tbl_book_copies;
select count(*) from tbl_book_copies;


-- Table: tbl_borrower
CREATE TABLE tbl_borrower (
    borrower_CardNo INT PRIMARY KEY,
    borrower_BorrowerName VARCHAR(255),
    borrower_BorrowerAddress TEXT,
    borrower_BorrowerPhone VARCHAR(15)
);
select * from tbl_borrower;
select count(*) from tbl_borrower;


-- Table: tbl_book_loans
CREATE TABLE tbl_book_loans (
    book_loans_LoansID INT PRIMARY KEY AUTO_INCREMENT,
    book_loans_BookID INT,
    book_loans_BranchID INT,
    book_loans_CardNo INT,
    book_loans_DateOut varchar(50),
    book_loans_DueDate varchar(50),
    FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID),
    FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo)
);
select * from tbl_book_loans;
select count(*) from tbl_book_loans;

-- Task Questions
-- 1.How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
 
 -- query 
SELECT
    b.book_Title AS Book_Title,
    lb.library_branch_BranchName AS Branch_Name,
    bc.book_copies_No_Of_Copies AS Number_Of_Copies
FROM tbl_book AS b
JOIN tbl_book_copies AS bc
    ON b.book_BookID = bc.book_copies_BookID
JOIN tbl_library_branch AS lb
    ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE b.book_Title = 'The Lost Tribe'
  AND lb.library_branch_BranchName = 'Sharpstown';


-- 2.How many copies of the book titled "The Lost Tribe" are owned by each library branch?

select b.book_Title, lb.library_branch_BranchName, bc.book_copies_No_Of_Copies 
from tbl_book as b
 join tbl_book_copies as bc
 on b.book_BookID=bc.book_copies_BookID
 join tbl_library_branch as lb
 on lb.library_branch_BranchID=bc.book_copies_BranchID
 where b.book_Title="The Lost Tribe";
 
-- 3. Retrieve the names of all borrowers who do not have any books checked out.

select  br.borrower_CardNo,br.borrower_BorrowerName
from tbl_borrower as br
left join tbl_book_loans as bl
on br.borrower_CardNo=bl.book_loans_CardNo
where bl.book_loans_CardNo is null;


-- 4.For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address. 
SELECT
    tb.book_Title AS Book_Title,
    br.borrower_BorrowerName AS Borrower_Name,
    br.borrower_BorrowerAddress AS Borrower_Address
FROM tbl_book_loans AS bl
JOIN tbl_library_branch AS lb
    ON bl.book_loans_BranchID = lb.library_branch_BranchID
JOIN tbl_book AS tb
    ON bl.book_loans_BookID = tb.book_BookID
JOIN tbl_borrower AS br
    ON bl.book_loans_CardNo = br.borrower_CardNo
WHERE lb.library_branch_BranchName = 'Sharpstown'
  AND bl.book_loans_DueDate = '2/3/18';
  
  
-- 5.For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
select lb.library_branch_BranchName,count(bl.book_loans_BookID) as total_books_loaned_out
from tbl_library_branch as lb
join tbl_book_loans as bl
on  lb.library_branch_BranchID=bl.book_loans_BranchID
group by lb.library_branch_BranchName;


-- 6.Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
select tb.borrower_BorrowerName,tb.borrower_BorrowerAddress,count(bl.book_loans_BookID) as no_of_books
from tbl_borrower as tb
join tbl_book_loans as bl
on tb.borrower_CardNo=bl.book_loans_CardNo
group by tb.borrower_BorrowerName,tb.borrower_BorrowerAddress
having no_of_books > 5;

-- 7.For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
SELECT
    tb.book_Title AS Book_Title,
    tbc.book_copies_No_Of_Copies AS Number_Of_Copies
FROM tbl_book AS tb
JOIN tbl_book_authors AS tba
    ON tb.book_BookID = tba.book_authors_BookID
JOIN tbl_book_copies AS tbc
    ON tb.book_BookID = tbc.book_copies_BookID
JOIN tbl_library_branch AS tlb
    ON tbc.book_copies_BranchID = tlb.library_branch_BranchID
WHERE tba.book_authors_AuthorName = 'Stephen King'
  AND tlb.library_branch_BranchName = 'Central';