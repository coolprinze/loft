const CronJob = require('cron').CronJob
const Job = (pattern, callBack, repeat = false) =>
  (job = new CronJob(pattern, () => {
    callBack()
    if (!repeat) job.stop()
  }))

module.exports = Job
