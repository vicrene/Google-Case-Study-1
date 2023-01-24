# Google Case Study #1
## Using Cyclistic to answer data question (Case Study 1 on the Google Data Analytics Course)

### Review by: Vic Garcia ([LinkedIn](https://www.linkedin.com/in/vicgarciaa/))
----------------------------------------------------------
The following work is part of an 8-course Google Data Analytics Certificate that concludes with a case study, in this case, using data from [Divvy](https://divvy-tripdata.s3.amazonaws.com/index.html) under the name "Cyclistics". I have used the six steps of the data analysis process learned through out the 8 courses in the Google Data Analytics program to answer key business questions. Ask, prepare, process, analyze, share, and act.

**[Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics?utm_source=gg&utm_medium=sem&utm_campaign=15-GoogleDataAnalytics-US&utm_content=B2C&campaignid=12504215975&adgroupid=149456125571&device=c&keyword=&matchtype=&network=g&devicemodel=&adpostion=&creativeid=636585380071&hide_mobile_promo&gclid=CjwKCAiAoL6eBhA3EiwAXDom5uU49f40FvgCx2oHcuga_xvYvt7VmUempOfuCGbxn66Gjj3L8ezsPBoCWqUQAvD_BwE)**

**[Github R Code](https://github.com/vicrene/Google-Case-Study-1/blob/master/Cyclistic_CaseStudy.R)**

**[Tableau Data Viz](https://public.tableau.com/app/profile/vic.garcia/viz/CyclisticDashboard-VG/Dashboard1)**

**email:** renegarciajr5@gmail.com

**[LinkedIn](https://www.linkedin.com/in/vicgarciaa/)**

## Scenario
You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## Characters and teams
- **Cyclistic:** A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.
- **Lily Moreno:** The director of marketing and your manager. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.
- **Cyclistic marketing analytics team:** A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy. You joined this team six months ago and have been busy learning about Cyclistic’s mission and business goals — as well as how you, as a junior data analyst, can help Cyclistic achieve them.
- **Cyclistic executive team:** The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.
------------------------------------------------------------------
## About the company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

**Moreno has set a clear goal:** Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

## Ask
**Three questions will guide the future marketing program:**
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

### Moreno has assigned you the first question to answer: **How do annual members and casual riders use Cyclistic bikes differently?**

You will produce a report with the following deliverables:
1. A clear statement of the business task
2. A description of all data sources used
3. Documentation of any cleaning or manipulation of data
4. A summary of your analysis
5. Supporting visualizations and key findings
6. Your top three recommendations based on your analysis
-----------------------------------------------------------------------------
# Guiding Questions 

## Ask
- **What is the problem you are trying to solve?**

How do annual members and casual riders use Cyclistic bikes differently?

- **How can your insights drive business decisions?** 

By evaluating the last 12 months of Cyclistic data, we can get a better understanding of trends by both types of members and therefore help stakeholders lead the next year with a better understanding of their customer base to lead more profitable business decisions.

## Prepare
- **Where is your data located?**

The data is located [here](https://divvy-tripdata.s3.amazonaws.com/index.html) and has been made available by Motivate International Inc. under this [license]( https://ride.divvybikes.com/data-license-agreement). For this project, I have not included the data in my Github. If you choose to look at the data yourself, please click the link above.

- **How is the data organized?** 

The data is organized by month for the years 2020 – 2022. For this project, we are looking at 12 files dated from Jan 2022 to Dec 2022.

- **Are there issues with bias or credibility in this data? Does your data ROCCC?**

The data is reliable, original, comprehensive, current, and cited. There is no bias or credibility issues with the data from what I can observe.

- **How does it help you answer your question?** 

The data helps to answer the question by providing 13 rows of anonymous data. The following are included: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual. 

-	**Are there any problems with the data?** 

There are duplicates, NA values, missing values in multiple columns & rows, and faulty data start/end times. Something that is not necessarily a problem but more of an obstacle is the unique ride IDs which means that I couldn’t determine how often one person used the service.

## Process 

-	**What tools are you choosing and why?** 

Initially, I tried using Excel but opening 12 very large files and doing initial cleaning on there was very time consuming to do. Since this is a case study and exhibition of my initial skills, I decided to speed up the process by using R Studio Desktop. Before opening R, I combined the all 12 data files using the Windows Terminal. Once converted into BIkeData.csv, I was able to do the initial cleaning on R. After performing the initial analysis on R, I then exported the clean data into a CSV file and opened the file in Tableau. The data visualization part of the case study was all done on Tableau. All notes, including this markdown file, is included within my Github page. 

-	**What steps have you taken to ensure that your data is clean? Have you documented your cleaning process so you can review and share those results?** 

For notes on my data cleaning, please look at my R script [here](https://github.com/vicrene/Google-Case-Study-1/blob/master/Cyclistic_CaseStudy.R)

## Analyze

- **What trends or relationships did you find in the data?** 

I was surprised to see that there are more members than casual riders, however, casual rider spent a lot more time per ride. Casual riders spent more time every day of the week on the bike, however, casual riders only spend more time than members on the weekends. Weekdays are predominantly Member riders.

- **How will these insights help answer your business questions?** 

Keeping the above in mind, it’s helpful to try to connect the dots with the idea that perhaps the casual users are tourists or people that might not regularly live near the city. This hypothesis can be supported by the observation that casual riders predominantly ride on the weekends. If we take into account the fact that many less people work on the weekend or might be visiting on the weekend, then it might explain the excess. Casual riders also tend to ride a lot less during the colder months and are right at or even surpass the member rider category during the warmer months. Possible ideas as to why this is include: students that have a lot more free time to explore the city, a lot more people vacationing in the summer than the winter or fall months, & summer and spring activities bring more events, such as festivals and markets to the city, which encourage bike share experiences.

## Share 
### For my Data Visualizations, please check out my [Tableau](https://public.tableau.com/app/profile/vic.garcia/viz/CyclisticDashboard-VG/Dashboard1).

- **Were you able to answer the question of how annual members and casual riders use Cyclistic bikes differently?** 

With the initial analysis, I was able to come up with a solid starting point as to why casual and member riders use Cyclisitic Bikes differently.

- **Who is your audience? What is the best way to communicate with them?**

My audience would be the people who have a direct financial connection to the program (my stakeholders), as well as the data team and my team lead. In addition, if this data can be offered publicly, it can help business owners and event planners have a better turnout. Allowing for their events to happen near bike share stations can help increase revenue and circulate a better turnout. 

## Act

- **Is there additional data you could use to expand on your findings?**

One thing that I left out because it was a bit challenging to navigate (and might have something to do with the way that I cleaned the data in R) is using the start/end latitudes and longitudes to create a data viz. Creating a data viz using this information to see how many rides are to a from the same station as well as the most concentrated amount of riders per area, per month, would be useful to figure out where advertisements can be implemented to attract those casual riders to add an annual membership. 

Another piece of data that wasn’t available but would be great for more insight would be having customer surveys. The best way, in my opinion, to go about this would be collecting data as to 1) why do they use the service, 2) what is something that holds them back from converting to an annual membership, 3) what services would they like to see added to Cyclistic. In return for casual rider feedback, they can get a 10-30% off of their ride for that specific trip. 

- **What is your conclusion based on your analysis? What next steps would you or your stakeholders take based on your findings?**

Ultimately, an annual membership needs to make sense for casual riders. Tourists might not be interested in the annual membership, but casual riders who might not use the bike often or who only visit the city during the weekends need to have an incentive to buy an annual membership and feel comfortable forgetting about it for a year. 

**To encourage casual riders to become members:**

1.	Introduce late fees and time caps to each individual ride that falls within single-day and full-day passes. A lot of casual riders use their pass for a much longer time than members. Making the single or full day pass more expensive might incentivize riders to just save money in the long run instead of being inconvenienced by higher fees.
2.	Introduce peak fees. Similar to ride share companies, if there is an event occurring such as a music festival, introduce peak fees that make casual riders pay slightly more per minute compared to member riders. Biggest thing is to make sure that the overall cost for these options are still well below the cost of car-based rideshare apps.
3.	Start a marketing campaign focused on converting casual riders to an annual membership concentrated in Central Chicago. Focus on promotional pricing in the summer when trips are high.

