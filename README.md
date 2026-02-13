# README

Name: Momen Suliman
ID: 900915295

Things you may want to cover:  

* Ruby version  
    this was done on version 3.3.2 after having to 'downdate' from 3.3.9  

* System dependencies  
    this mini project was fully done via ruby on rails and react + vite for the frontend no other dependencies were used.  
  
* Configuration  
    the display of foreign keys was changed from the default and now shows the prefixes, courses, sections, students.  

* Database creation  
    the database creation was done via the framework when a scaffold was generated.  

* Database initialization  
    the database was created via the scaffold command and was not changed from what the .yml file tests for.  

* How to run the test suite
<pre>

    step 1: clone the repo  
    step 2: setup
            step 2.1: "npm install" this is vite version: "@vitejs/plugin-react": "^4.3.2" found in package.json.  
            step 2.2: "bin/vite build --clear --mode=development" should create a runnable build.  
            step 2.3: "rails s".  
    step 3: visit http://localhost:3000.  
    step 4: navigate to any of the tabs shown on the banner.  
    step 5: create a few of each model type (prefixes, courses, sections, students).  
    step 6: visit the sections or students pages and search for sections/students you've created.  
    step 7: feel free to mark up the read me for any corrections or additional features you'd like.  
    
</pre>

* Services (job queues, cache servers, search engines, etc.)  
    this mini-app has established one-to-one, one-to-many, & many-to-many relations using the 4 models (prefixes, courses, sections, students).  

* Deployment instructions  
    This project is still in dev.  

* Sidenote  
    I had to use AI (claude) for providing a TODO list along with other tasks like helping with CRUD operations for Prefix, Course, Section, & Student. ensure relationships like has_many, belongs_to, has_and_belongs_to_many, some form controls like buttons and checkboxes, validation, display related errors on the frontend, ensure proper testing, and populating random test data. Other uses were "how to" "which file" "provide template for..." and other QOL assistance.  

* Extra credit  
    added a background image to the 5 main pages (home, prefixes, courses, sections, students).  