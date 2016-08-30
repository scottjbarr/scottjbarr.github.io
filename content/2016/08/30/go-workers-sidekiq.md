+++
Categories = ["Development", "Golang"]
Description = ""
Tags = ["Development", "Go", "Golang", "AWS", "S3", "Redis"]
date = "2016-08-30T20:05:00+10:00"
menu = "main"
title = "Processing Sidekiq jobs with Go Workers"

+++

I have a personal project where a
[Sidekiq](https://github.com/mperham/sidekiq) worker (written in Ruby)
was using between 150-200MB of RAM with 20 workers. These workers take
images that have been uploaded to a Rails application, and upload them
to an Amazon S3 bucket in the background. Most of the time these
workers are idle. This project generates exactly $0.00 income, and I'm
paying for that RAM, which even in the amazing days of cloud
computing, is still too expensive to waste on a personal budget.

I decided to replace the Ruby process with a Go process in an attempt
to reduce this wasted, idle RAM. (Sadly I do this kind of thing a
lot).

To replace the Ruby process, I needed to write some Go code that could
upload files to Amazon S3, and process Sidekiq jobs from a Redis
queue.

The code that does the upload was really easy to write using the
official [AWS Go SDK](https://github.com/aws/aws-sdk-go) library. I
wrote nothing more than a little wrapper really.

I then added an application that picks up Sidekiq jobs from
Redis. This wasn't too difficult as the
[Gokiq](https://github.com/cupcake/gokiq) library does most of the
heavy lifting here. Working out a nice way to unpack the job data into
my Worker struct without modifying the Gokiq library took some
thought, but came out OK.

## End Result

The Go process uses 28MB of RAM with 200 workers available. Compared
to the 150-200MB of RAM with 20 workers that I had before, this is a
nice little win.

Take a look at the
[s3uploader](https://github.com/scottjbarr/s3uploader) repository on
Github if is sounds useful.
