<a name="readme-top"></a>

<div align="center">
  <img src="./draft.png" alt="logo" width="256"  height="auto" />
  <br/>

  <h2><b>Recipe App</b></h2>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo & Project Presentation](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Recipe App <a name="about-project"></a>

**Recipe App** The Recipe app keeps track of all your recipes, ingredients, and inventory. It will allow you to save ingredients, keep track of what you have, create recipes, and generate a shopping list based on what you have and what you are missing from a recipe. Also, since sharing recipes is an important part of cooking the app should allow you to make them public so anyone can access them. These are some of the interfaces and some wireframes for some of them:

 - **A login page.**
 - **A registration page.**
 - **A food list (with all CRUD implementation, except for 'update').**
 - **A recipes list (with all CRUD implementation, except for 'update').** 
 **A general shopping list view (all missing food for all your recipes and total price).**
 **A list of all public recipes from other users with their names and total prices.**

 <!-- <img src="#" alt="app-demo" /> -->

 </br>

## Project requirements

### General requirements

- Make sure that there are [no linter errors](https://github.com/microverseinc/linters-config).
- Make sure that you used correct [Gitflow](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/git-github/articles/gitflow.md).
- Make sure that you documented your work [in a professional way](https://github.com/microverseinc/curriculum-transversal-skills/blob/main/documentation/articles/professional_repo_rules.md).

### Ruby requirements

- Follow our list of [best practices for Ruby](https://github.com/microverseinc/curriculum-ruby/blob/main/articles/ruby_best_practices.md).

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<ul>
  <li>Ruby</li>
  <li>Ruby on Rails</li>
  <li>JavaScript</li>
  <li>PostgreSQL</li>
  <li>GitHub</li>
  <li>CSS/SCSS(Bootstrap)</li>
</ul>

<!-- Features -->

### Key Features <a name="key-features"></a>

- Set up the ROR project and install the Devise gem
- Create the food and recipe models and their associations
- Implement the food list feature
- Implement the recipe list feature
- Implement the public recipe list feature
- Implement the recipe toggle feature
- Implement the general shopping list feature
- Write unit and integration

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo & Project Presentation <a name="live-demo"></a>

- Live Demo coming soon...

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

### Prerequisites

Everything will be based on the ERD class diagram presented below. 

</br>
 <div align="center">
    <img alt="gif" src="./recipe_erd_2_members.png" width=50% />
    <p>Entity Relationship Diagram (ERD) of Recipe App project</p>
</div>

## Getting Started
To run the project locally, copy up and running follow these simple example steps :

 - First of all make sure you have both `Ruby` & `Rails` installed in your machine
 (else You can install `Rails` just with this simple command  ```gem install rails```)
```
$ git clone ### Setup
- Clone this repository to your computer: git clone https://github.com/ONJoseph/recipe-app.git
```
 - Then go to the right folder 
```
$ cd recipe-app
```
```
$ bundle
```
and run to install npm package
```
$ npm install
```

make sure the database is up and running.
```
$ rails db:create
```
When you will add migration file then, you can add command like
```
$ rails db:migrate
```
Run this command line to add some dummy data
```
$ rails db:seed
```

 - Finaly run `rails s` and visit http://localhost:3000/  in your browser!

 ## Run tests :

 To run Request specs locally you need just to run this following command in your terminal :

 ```
 $ bundle exec rspec
 ```
 </br>
 <div align="center">
    <kbd>
    <img alt="gif" src="" width=90% />
    <p></p>
       </kbd>
</div>

### Install
- Write: bundle install
- Write: npm install

### Usage
- To test the app:
    - rspec (general)
    - rspec spec/unit/name_of_sile (specific one)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Author <a name="authors"></a>

👤 **Joseph Ogbole**

- GitHub: [@ONJoseph](https://github.com/ONJoseph)
- Twitter: [@ONJoseph1](https://twitter.com/ONJoseph1)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/o-n-joseph-ba8425147/)

👤 **Ivan Martinez von Halle**

- GitHub: [@ivanmvh](https://github.com/ivanmvh)
- Twitter: [@imprivado](https://twitter.com/imprivado)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/ivan-martinez-von-halle/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] Add Inventories list
- [ ] Add Inventory details
- [ ] Add Recipe details
- [ ] Add Inventory shopping list

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ONJoseph/recipe-app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

I really enjoyed working on this project. If you like it show your support by giving a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Acknowledgments -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

Hat tip to anyone whose code was used.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](https://github.com/ONJoseph/recipe-app/blob/dev/LICENCE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
