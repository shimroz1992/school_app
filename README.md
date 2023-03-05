
## Getting Started

You can **setup environment install all dependencies manually**:


<details>
<summary><b>1. Install <code>rvm</code></b></summary>

Make sure [rvm](https://www.rvm.io/rvm/install) is installed, it will allow to switch between Ruby versions.

```bash
# set gpg key
gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# Set up rvm in your shell
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```

</details>

<details>
<summary><b>2. Install the right Ruby version</b></summary>

Run the following command in the project root:

```bash
rvm install 3.1.2
```

</details>

<details>
<summary><b>3. Install <code>postgres</code></b></summary>

```bash
# Install Postgres
sudo apt install postgresql postgresql-contrib

# Start Postgres
sudo systemctl start postgresql.service
```

</details>

<details>
<summary><b>4. Install Ruby gems</b></summary>

Now, let's install all needed Ruby gems for the project using Bundler.

```bash
bundle install
```

</details>

<details>
<summary><b>5. Prepare databases</b></summary>

Now, open config/database.yml .


```bash
# change username and password according to your local config
username: your_postgresql_user
password: your_password
```


```bash
# Create database
rails db:create
rails db:migrate

# Seed data
rails db:seed

# data for test
rails db:migrate db:test:prepare
```

</details>

<details>
<summary><b>6. Start the application</b></summary>

```bash
# Run command
rails s
```

</details>

<details>
<summary><b>7. Run specs</b></summary>

```bash
rspec
```

</details>




## Access your local admin panel

| Login id       | Password   |
| -------------- | ---------- |
| `admin@me.com` | `12345678` |


