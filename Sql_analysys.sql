create database new_db_for_p1;
use new_db_for_p1;
select * from online_course_engagement_data;

# How many Unique users are using the platform?
select count(distinct userid) AS Distinct_Users from online_course_engagement_data;  #8123

# List of users who have taken more than one course.alter
select userid, count(coursecategory) as No_of_courses_enrolled from online_course_engagement_data
group by userid 
having count(coursecategory)>1;

# How many students have taken more than 1?  #877
select count(userid) as more_than_one_course 
from (select userid, count(coursecategory) as No_of_courses_enrolled from online_course_engagement_data
group by userid 
having count(coursecategory)>1) t1;

# Maximum course one student is enrolled?  #2
select max(No_of_courses_enrolled) from (select userid, count(coursecategory) as No_of_courses_enrolled from online_course_engagement_data
group by userid 
having count(coursecategory)>1) t1;

desc online_course_engagement_data;

# How many cousecategories are there? and List them all.
select count(distinct coursecategory) from online_course_engagement_data;      #5
select distinct coursecategory from online_course_engagement_data;  

# No of students per couse
select coursecategory, count(userid) as no_of_stedents 
from online_course_engagement_data
group by coursecategory;

# Average quiz score of each course:
select coursecategory, avg(quizscores) from online_course_engagement_data
group by coursecategory;

#How does average time spent differ between completed and non-completed users?
select coursecompletion, avg(TimeSpentOnCourse)  from online_course_engagement_data
group by CourseCompletion;
#Do users who complete courses watch more videos on average?   # Yes
select coursecompletion, avg(NumberOfVideosWatched) from online_course_engagement_data    
group by CourseCompletion;

#Is the number of quizzes taken higher for completed users?     # yes 
select coursecompletion, Avg(NumberOfQuizzesTaken) from online_course_engagement_data
group by CourseCompletion;

#Are quiz scores significantly different for completed vs non-completed users?       YES, 
select coursecompletion, avg(QuizScores) from online_course_engagement_data
group by CourseCompletion;

#Which course category has the highest = health / lowest = science completion rate?
select coursecategory, avg(CompletionRate) as c_r from online_course_engagement_data
group by coursecategory;

select coursecategory from (select coursecategory, avg(CompletionRate) as c_r from online_course_engagement_data
group by coursecategory) as t
where c_r = (select min(c_r) from (select coursecategory, avg(CompletionRate) as c_r from online_course_engagement_data
group by coursecategory) t1);

select coursecategory from (select coursecategory, avg(CompletionRate) as c_r from online_course_engagement_data
group by coursecategory) as t
where c_r = (select max(c_r) from (select coursecategory, avg(CompletionRate) as c_r from online_course_engagement_data
group by coursecategory) t1);


# Is course completion rate different for mobile vs desktop users?
select DeviceType, avg(CompletionRate) from online_course_engagement_data
group by DeviceType;                                 # Not that much difference 
# Do mobile users spend less time on courses?
select DeviceType, avg(TimeSpentOnCourse) from online_course_engagement_data
group by DeviceType;                                 # Not that much difference 

# Are quiz scores lower on mobile compared to desktop?
select DeviceType, avg(QuizScores) from online_course_engagement_data
group by DeviceType;                                 # Not that much difference 

# Does device impact completion within the same course category?
select DeviceType, CourseCategory, avg(CompletionRate) from online_course_engagement_data
group by DeviceType, CourseCategory
order by devicetype, CourseCategory
; 

# What % of users watched very few videos but still completed?   #  0.0416
select count(distinct userid) as cu from online_course_engagement_data
where CourseCompletion = 1 and NumberOfVideosWatched < 5;

select (select count(distinct userid) as cu from online_course_engagement_data 
where CourseCompletion = 1 and NumberOfVideosWatched < 5) / (select count(distinct userid) from online_course_engagement_data) 
as  percentage_ofuserswatched_very_few_videos_but_still_completed; 

 #Do users with high quiz attempts but low scores complete less?   # 223
select count(distinct userid) as cu from online_course_engagement_data
where QuizScores < 60 and NumberOfQuizzesTaken > 8 and CourseCompletion = 0;

# Which course categories require more time to complete?  
select coursecategory, avg(TimeSpentOnCourse) as m_c from online_course_engagement_data
group by coursecategory
order by m_c desc
limit 3;


# Do some categories show low completion despite high engagement?  'Programming', '50.66118967743853'  
# Answer for this question is no.
select coursecategory from online_course_engagement_data
where CourseCompletion = 0
group by coursecategory 
having avg(TimeSpentOnCourse) > 50.66118967743853 
and count(NumberOfQuizzesTaken) > 5
;













