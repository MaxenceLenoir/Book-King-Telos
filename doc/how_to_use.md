## Local Development

### Prerequisites

If you don't already have them :

- Install ruby 2.6.6 `rbenv install 2.6.6 && rbenv global 2.6.6`
- Install NodeJS (version 14, you may use [nvm](https://github.com/nvm-sh/nvm) if you have several versions)
- Install yarn `npm i -g yarn`

### Install PostgreSQL:

#### Using your favorite package manager

Install postgresql directly on your machine, for example with
`brew install postgresql` on macOS.

### Dependencies

Setup the project's dependencies :

```bash
bundle install
yarn install
rails db:create
```

### Database / Cache

- Run the migrations : `rails db:migrate RAILS_ENV=development`
- Run the db services according to your installation

### Running

```bash
rails s
```

### Data seed

To populate data seeds for your dev environment, run the following command :

```ruby
rails db:seed
```

### Admin development

In a rails console with `rails c`

```ruby
buyer = Buyer.find_by(email: <your_email>)
```

## Testing

To launch the tests locally, run:

```bash
rspec
```