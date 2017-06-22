# literate-waffle
driver tracker and update on coordinates

This is a RoR application. I chose RoR because I have started to pick it up and
wanted to have a crack at the problem with the new stack. IMHO the beast way to
learn something is by applying it immediately. I have tried to follow the best
practices and keep the code as modular and readable as I could.

This application uses Ruby 2.4.0 and Rails 5.1.

I have setup ruby locally using RVM and then installed gems to set up the requirements for the application.

rake db:create db:migrate db:seed will set up the database and seed the `drivers`
table with the 50,000 drivers.

I am developing a test script in python to test drive the application. This is a
 WIP and will be available soon.
