-- How to create an index
create index idx_emp_did on emp(did);

select * from idx_emp_did;

-- for indexes:
-- use on the where clause

-- for indexes with multi-columns:
-- start with the column that has an exact match (e.g: ename = 'jeff') then the second column

-- index on joins:
-- index only the foreign primary key

--index on group-by-columns:
-- use on group-by column
-- for multi columns, index both in the same index

--index on order:
-- use on the order by column

-- index on select with no where, group-by, order by clause: also known as cover index
-- index all columns that are provided in the select clause, don't miss any of the columns
