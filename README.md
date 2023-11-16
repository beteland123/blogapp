
<a name="readme-top"></a>

<div align="center">

  <h3><b>"Blog App"</b></h3>

</div>


## Table of Contents

- [Tech Stack](#tech-stack) 
- [Key Features](#key-features) 
- [Getting Started](#getting-started) 
  - [Setup](#setup) 
  - [Installation](#installation) 
  - [Usage](#usage) 
  - [Tests](#tests)  
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

# 📖 ["Blog App"] <a name="about-project"></a>

**["Blog App"]**  is a classic example of a blog website. It is  a fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts.

## 🛠 Built With <a name="built-with"></a>

1- Ruby<br>
2- Gitflow<br>
3- Rubocop<br>
4- Ruby On Rails

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://www.microverse.org/">Microverse</a></li>
  </ul>
</details>

<details>
<summary>Ruby</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/">Ruby</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- [] **[Add migration got post, user, comment and like according the ER]**
- [] **[Added foreign keys and indexes to ensure data integrity and optimize database queries]**
- [] **Processing data in models.**
- [] **Validations and Model specs.**
- [ ] **Setup and controllers.**
- [ ] **Controllers specs.**
- [ ] **Integration specs for Views and fixing n+1 problems.**
- [ ] **Add device.**
- [ ] **Add authorization rules**
- [ ] **Add API end point.**
 

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Getting Started<a name="getting-started"></a>

### Setup <a name="setup"></a>

1. Ensure you have Ruby installed on your system. You can check your Ruby version in the terminal by running:

```
ruby -v
```

If Ruby is not installed, you can download and install it from the official Ruby website.

2. Ensure you have Ruby on Rails (RoR) installed on your system. You can check your Rails version in the terminal by running:

```
rails -v
```

If Rails is not installed, you can install it using the following command:

```
gem install rails
```
3. To get a local copy up and running, follow these steps.
Choose the directory on your local machine where you want to copy project. For example:

```
cd /home/user/your-directory
```
Clone the project :

Using HTTPS:

```
git clone https://github.com/beteland123/blogapp.git
```

### Installation <a name="installation"></a>

To run this project locally, follow these steps:

1. Open your terminal or command prompt.

2. Navigate to the directory where you have cloned this repository.

3. Run the following command to install any required dependencies:
```bundle install```

### Usage <a name="usage"></a>

1. Once the setup is complete, ensure you are still in the directory containing the blogapp files.

2. To set up the database and seed initial data, run the following commands:

```
rails db:create
rails db:migrate
```

This will create the database and apply migrations.

If you want to populate the database you can run (this step is not required):

If you want to populate the database you can run (this step is not required):

```
rails db:seed
```

3. To precompile assets for production deployment, execute the following command:

```
rails assets:precompile
```

Precompiling assets is essential for improved performance and loading times in a production environment.

4. To run the app in development mode, execute the following command:

```
rails server
```

5. The app will be accessible at `http://localhost:3000` in your web browser.

### Tests

To run tests, run the following command:
1. Install RSpec:

Find your gemfile and add the RSpec gem in the development, test group:

```
group :development, :test do
  gem 'rspec-rails'
end
```

2. Then in your terminal run the command:

```
bundle install
```

3. To set up RSpec in your app and create the Spec folder run:

```
rails generate rspec:install
```

4. Run the tests for all the models using the following command:

```
rspec spec/models
```

5. Alternatively, you could run tests for any specific suit using the following command (an example for Like model):

```
rspec spec/models/like_spec.rb
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Authors <a name="author"></a>

👤 **Micronaut Betel Andarge**

- GitHub: [@beteland123](https://github.com/beteland123)
- Twitter: [@betelandarge](https://twitter.com/BetelAndarge)
- LinkedIn: [LinkedIn](https://linkedin.com/in/betelandarge)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>



- [ ] **Update the CRUD logic to allow editing of comments and posts.**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

If you like this project, please give a ⭐️ (Thank you)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

- I would like to thank Microverse for this learning opportunity.

- [Microverse team](https://microverse.org/)

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
 

