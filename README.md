# GoodThought NGO Impact Analysis

## Overview
GoodThought is an NGO operating across multiple regions, running assignments 
funded by donations from individuals and organisations. This project uses SQL 
to analyse donation patterns and measure the impact of assignments across regions.

## Business Problem
Which assignments are attracting the most donations and which are delivering 
the highest impact per region? This analysis helps GoodThought allocate 
resources more effectively.

## Queries

**Query 1 — Highest Donation Assignments**
Identifies the top 5 assignments by total donation amount, broken down 
by region and donor type using a CTE and multi-table JOINs.

**Query 2 — Top Regional Impact Assignments**
Uses a ROW_NUMBER() window function to identify the single highest 
impact assignment in each region, along with total donation count.

## Tools & Skills Used
- SQL (PostgreSQL)
- CTEs (Common Table Expressions)
- Window Functions (ROW_NUMBER)
- Multi-table JOINs
- Aggregation & Grouping

## Dataset
Data provided via DataCamp — includes Assignments, Donations, and Donors tables.

## About
Completed as part of the DataCamp Data Analyst curriculum.
