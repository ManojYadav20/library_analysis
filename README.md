

# SQL Library Management Database Analysis

### Project Type

Database Design & SQL Analysis

### Author

**P. MANOJ YADAV**

---

# 📚 Overview

This project focuses on designing and implementing a relational **Library Management Database** using SQL. The database was built to manage and analyze information related to publishers, books, authors, library branches, borrowers, book copies, and loans.

The project demonstrates:

* Relational database design
* Data integrity implementation
* Advanced SQL querying
* Analytical reporting using real-world library scenarios

The analysis helps answer operational questions related to inventory management, borrower behavior, branch activity, and acquisition planning.

---

# 🚀 Key Features

* Designed a normalized relational database schema
* Implemented primary keys, foreign keys, and constraints
* Performed analytical SQL queries using:

  * JOINs
  * GROUP BY
  * HAVING
  * CTEs
  * Window Functions
* Generated insights for:

  * Branch-wise inventory
  * Loan activity
  * Due-date monitoring
  * Borrower analysis
  * Author-level holdings

---

# 🛠️ Technologies Used

* SQL
* Relational Database Design
* ER Modeling
* CTEs
* Window Functions
* Aggregate Functions

---

# 📂 Project Deliverables

The repository includes:

* SQL DDL scripts for table creation
* Constraints and relationship definitions
* SQL DML scripts/sample data
* Query scripts for all use cases (Q1–Q7)
* ER Diagram
* Project PPT with observations and insights

---

# 📊 Key Queries & Findings

## Q1. Inventory for a Specific Title at a Branch

### Observation

Joined `tbl_book`, `tbl_book_copies`, and `tbl_library_branch` to filter by title and branch.

### Result

Sharpstown branch holds **5 copies** of *The Lost Tribe*.

### Insight

The branch maintains healthy inventory levels for high-demand titles.

---

## Q2. Inventory of a Title Across All Branches

### Observation

Retrieved branch names and copy counts for a selected title.

### Result

*The Lost Tribe* is available across multiple branches with balanced distribution.

### Insight

Balanced inventory improves accessibility for borrowers across locations.

---

## Q3. Borrowers with No Books Checked Out

### Observation

Used `LEFT JOIN` between borrowers and loans tables and filtered NULL records.

### Result

Identified inactive borrowers with no checkout history.

### Insight

Useful for engagement campaigns and membership activity tracking.

---

## Q4. Loans Due on a Specific Date from Sharpstown

### Observation

Joined branch, borrower, loans, and books tables with due-date filtering.

### Result

Multiple books due on the same date were borrowed by a single member.

### Insight

Highlights borrower concentration and supports overdue monitoring.

---

## Q5. Total Books Loaned Per Branch

### Observation

Grouped total loan counts by branch.

### Result

Loan activity was balanced across branches, with Central branch slightly leading.

### Insight

Supports branch-level resource and inventory planning.

---

## Q6. Borrowers with More Than Five Loans

### Observation

Used a CTE to calculate loan counts per borrower.

### Result

Identified heavy borrowers with high loan activity.

### Insight

A small number of users contribute significantly to total circulation activity.

---

## Q7. Copies of Stephen King Titles at Central Branch

### Observation

Used window functions to calculate author-level holdings.

### Result

Central branch maintains multiple copies of Stephen King titles.

### Insight

Popular author analysis helps optimize acquisition planning.

---

# ▶️ How to Run the Project

## 1. Create Database Schema

Run the DDL scripts to create all tables and constraints.

## 2. Load Sample Data

Import the provided sample datasets or CSV files.

## 3. Execute Query Files

Run SQL query scripts from the `queries/` folder.

## 4. Review Outputs

Compare outputs with the included PPT and documentation.

---

# 🎯 What I Learned

* Designing normalized schemas improves scalability and data consistency
* Constraints help maintain relational integrity
* CTEs and window functions simplify complex analytical queries
* SQL can transform transactional data into meaningful business insights

---

# 🔗 Project Resources

* ER Diagram
* SQL Scripts
* Project Presentation
* Query Outputs
* Insights Documentation

---

# 📌 Future Improvements

* Add stored procedures and triggers
* Develop interactive dashboards using Power BI/Tableau
* Integrate Python for advanced analytics
* Build a frontend application for library operations

