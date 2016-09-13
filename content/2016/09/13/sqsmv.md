+++
Categories = ["Development", "Golang"]
Description = ""
Tags = ["Development", "Go", "Golang", "AWS", "SQS"]
date = "2016-09-13T23:50:00+10:00"
menu = "main"
title = "sqsmv"
+++

Recently we ran into a situation at work where we needed to move all
messages from one of our dead letter queues, back onto the "live"
queue for the service.

AWS doesn't expose a way to move messages out of the box, so I wrote a
small utility, which I creatively
named [sqsmv](https://github.com/scottjbarr/sqsmv).

I wrote the project in [Go](https://golang.org/) because it is a great
fit for system programs, and I've worked with
the [Go AWS SDK](https://github.com/aws/aws-sdk-go) before.

I created a bunch of messages and tested it... First try! This is
something I find happens more often when I'm building with Go,
compared to doing the same task with a dynamic language.

[sqsmv](https://github.com/scottjbarr/sqsmv) has worked well,
successfully moving hundreds of messages successfully between
queues. I hope someone out there finds it useful.
