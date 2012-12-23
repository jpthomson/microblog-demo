## MicroBlog Demo

Prototyping a commercial, scaleable Rails application and all that entails (authentication, authorization, admin, APIs, etc.)

### What does it do?

Current features include:

* Multi-provider authentication using Devise and OmniAuth.
* Authorization using CanCan and Rolify.
* An admin interface using ActiveAdmin.
* A RESTful API.

For a complete overview of the plans and current status of the project, see the [roadmap](https://github.com/jbrunton/microblog-demo/wiki/Roadmap) on the wiki.

### Try it out

To grab a copy and set it up:

    git clone https://github.com/jbrunton/microblog-demo.git
    cd microblog-demo
    bundle install --without production
    rake db:setup

Then, to run it:

    rails s

It should now be running at [localhost:3000](http://localhost:3000).

You can also try the application at [microblog-demo.herokuapp.com/](http://microblog-demo.herokuapp.com/).

For more documentation on trying out the features (including users which are present in the seeds.rb file/on the demo instance), see the [demo page](https://github.com/jbrunton/microblog-demo/wiki/Demo) on the wiki.

### Documentation

For reference, details of the implementation and a series of How Tos will be put on the [the wiki](https://github.com/jbrunton/microblog-demo/wiki), as and when I find the time.
