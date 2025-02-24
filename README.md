# Homey Task

Take home task for Homey

https://allentities.notion.site/Task-Development-Team-d5aae74100544f84981972edb3d922b0

# Task

Use Ruby on Rails to build a project conversation history. A user should be able to:
* leave a comment
* change the status of the project

The project conversation history should list comments and changes in status. 

Please don’t spend any more than 3 hours on this task.

# Brief

Treat this as if this was the only information given to you by a team member, and take the approach you would normally take in order to build the right product for the company. 

To this extent:
* Please write down the questions you would have asked your colleagues
* Include answers that you might expect from them
* Then build a project conversation based on the answers to the questions you raised.

## Questions

Questions I've considered:

**What roles do we have and what can they do?**
Admin, Project Owner, Project Member

While I added authentication, I didn't have time to implement roles. I would
have liked to allow editing and deleted comments and preventing standard uses
from editing and deleting projects.

**Do projects have only a single conversation or do they have multiple conversation threads?**
Single conversation thread. (I'm considering like Github issues — each issue
could be considered a "project" and there is only a single "thread" there)

**What statuses can a project have?**
Draft, In Progress, Completed, On Hold, Cancelled.

**Do we need to notify anyone of new comments and status changes?**
I'm going to skip adding emails
