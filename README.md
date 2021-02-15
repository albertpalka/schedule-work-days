# KNOWN ISSUES / TODO

* Creating schedule for multiple months ahead is "too damn slow". Need to move this out of the controller into a background async job.
* When editing Schedule, WorkDays are not UPDATED. Need to refactor CreateWorkDay service object.
* For some reason not all WorkDays are created properly when running the assigned service object. Needs to be reviewed.
* Viewing schedule with dozens/hundreds of days is too slow on load. Need to implement pagination with some basic filtering to meet the app's requirements.
* Add API
* Add specs (in progress)
* Add flash notices
* Missing the reports' views for now.
