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

**What roles do we have?**
Admin, Project Owner, Project Member

**Do projects have only a single conversation or do they have multiple conversation threads?**
Single conversation thread. (I'm considering like Github issues — each issue could be considered a "project" and there is only a single "thread" there)

**Who can leave a comment?**
Only users with access to the project.

**What statuses can a project have?**
Draft, In Progress, Completed, On Hold, Cancelled.

**Who can change the status of a project? (and who should the history be visible to?)**
Only project owners (Possibly assigned members) can change it and only users with access to the project can see the changes.

**Should comments be editable or deletable?**
Admins can do everything, but users can only edit and delete their own comments.

**Do we need to notify anyone of new comments and status changes?**
(I'm going to skip this)
