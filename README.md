# README

**A Ruby on Rails and React (Vite) mini-project featuring a student management system. Includes one-to-one, one-to-many, and many-to-many relationships between Prefixes, Courses, Sections, and Students. Key features: custom foreign key displays, CRUD operations, background imagery, and a search function.**

---
### Deployed On Render

- Visits: [Student Management System](https://rubyonrails-crudapp.onrender.com/)

---

Things you may want to know:  

* Rails version  
    this was done on version 8.0.5.1  

* Ruby version  
    this was done on version 3.3.2 after having to 'downdate' from 3.3.9  

* System dependencies  
    Check /package.json & /Gemfile to see list of dependencies. 
  
* Configuration  
    the display of foreign keys was changed from the default and now shows the prefixes, courses, sections, students.  

* Database creation  
    the database creation was done via the framework when a scaffold was generated but edit for user usability.  

* Unit Testing  
    Unit testing was done via GitHub & rails test for 90% coverage along with linting.  

* How to run the test suite
<pre>

    step 1: clone the repo  
    step 2: setup
            step 2.1: "bundle install" this is vite version: "@vitejs/plugin-react": "^4.3.2" found in package.json.  
                bundle exec rails assets:precompile  
                bundle exec rails assets:clean  
                bundle exec rails db:migrate  
                bundle exec rails db:seed  
            step 2.2: "bin/vite build --clear --mode=development" should create a runnable build.  
            step 2.3: "rails s".  
    step 3: visit http://localhost:4000.  
    step 4: navigate to any of the tabs shown on the banner.  
    step 5: create a few of each model type (prefixes, courses, sections, students).  
    step 6: visit the sections or students pages and search for sections/students you've created.  
    step 7: feel free to mark up the read me for any corrections or additional features you'd like.  
    
</pre>

* Services (job queues, cache servers, search engines, etc.)  
    this mini-app has established one-to-one, one-to-many, & many-to-many relations using the 4 models (prefixes, courses, sections, students).  

* Deployment instructions  
    This project has been deployed on Render.
    