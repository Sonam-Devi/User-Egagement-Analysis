# Online Course User Engagement & Completion Analysis

## Project Overview
This project analyzes user engagement and course completion behavior on an online learning platform.  
The goal is to understand what factors influence whether a learner completes a course and to generate data-driven recommendations to improve engagement and retention.

## Business Problem
Online learning platforms often face low course completion rates.  
The key question explored in this project is:

> What user behaviors are associated with successful course completion?

## Dataset
Source: Kaggle – Predict Online Course Engagement Dataset

Each record represents a user’s interaction with a course and includes:
- `UserID`
- `CourseCategory`
- `TimeSpentOnCourse`
- `NumberOfVideosWatched`
- `NumberOfQuizzesTaken`
- `QuizScores`
- `CompletionRate`
- `DeviceType` (Desktop/Mobile)
- `CourseCompletion` (0 = Not Completed, 1 = Completed)

## Tools Used
- **SQL** – Data exploration and behavioral analysis  
- **Tableau** – Data visualization and dashboards  
- **Excel** – Initial data inspection and validation  

## Key Analysis Performed (SQL)
- Counted unique users and multi-course enrollments
- Compared engagement metrics between completed vs non-completed users
- Analyzed completion rates across course categories
- Evaluated impact of device type on engagement and completion
- Identified edge cases (e.g., low video views but completed)

## Key Insights
1. Users who completed courses watched more videos, attempted more quizzes, and had higher quiz scores.
2. Time spent on the course alone did not guarantee completion.
3. Completion rates were similar across all course categories.
4. Device type (mobile vs desktop) had minimal impact on outcomes.
5. Most users enrolled in only one course, indicating low cross-course adoption.

## Visualizations (Tableau)
- Completion vs Non-completion by Course Category  
- Time Spent vs Completion Rate  
- Engagement Metrics Comparison (Videos, Quizzes, Scores)  
- Device-wise Completion Analysis  

## Business Recommendations
- Introduce more interactive and engaging quizzes to increase learner interest.
- Add fun activities and structured learning paths to encourage users to enroll in multiple courses.
- Focus on improving engagement quality rather than simply increasing course duration.

## Conclusion
Active engagement behaviors (quizzes, video interaction, performance) are stronger indicators of course completion than total time spent. Improving course interactivity and learner motivation can increase both completion rates and platform revenue.

- Perform cohort analysis to track engagement over time.
- Test gamification and reward mechanisms to improve retention.
