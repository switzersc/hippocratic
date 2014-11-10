# Hippocratic

Hippocratic is a simple wrapper for the Physicans Desk Reference. Sicne the PDR doesn't have an API and I needed a simple way
to get information about drugs, I wrote Hippocratic, which basically uses Nokogiri to search and parse pdrhealth.com. It essentially creates
an object based on the PDR page for the drug you specify, with basic methods available to get the info you need.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hippocratic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hippocratic

## Usage

To find info about a drug, simply instantiate a new Drug Reference object with the name of the drug:

```ruby
reference = Hippocratic::DrugReference.new("Sudafed")

reference.valid?
=> true

reference.description
=> "What is this medication?Sudafed contains a nasal decongestant. It is intended to temporarily relieve sinus congestion and pressure. It is also intended to temporarily relieve nasal congestion due to the the common cold, hay fever, and other upper respiratory allergies. Sudafed 24 Hour is also intended to reduce the swelling of nasal passages."

reference.side_effects
=> "What are the possible side effects of Sudafed?If you are taking Sudafed 24 Hour, tablets of this kind may cause a bowel obstruction, usually in people with a severe narrowing of the bowel (esophagus, stomach, or intestine).    Side effects cannot always be anticipated. If any develop or change in intensity, tell your doctor as soon as possible. Only your doctor can determine if it is safe for you to continue taking this drug."

reference.storage
=> "How should I store Sudafed?Store Sudafed Congestion at room temperature. Store Sudafed 12 Hour and Sudafed 24 Hour at room temperature in a dry place. Protect Sudafed 12 Hour from light."

reference.dosage
=> "What is the usual dosage of Sudafed?Sudafed Congestion:  Adults and children ≥12 years: Take two 30-milligram (mg) tablets every 4 to 6 hours. Do not take more than 8 tablets in 24 hours.    Children 6-11:  Take1 tablet every 4 to 6 hours. Do not take more than 4 tablets in 24 hours.     Children Do not use.    Sudafed 12 Hour:  Adults and children ≥12 years: Take one 120-mg tablet every 12 hours. Do not take more than 2 tablets in 24 hours.    Children  Do not use.    Sudafed 24 Hour:  Adults and children ≥12 years: Swallow one whole 240-mg tablet with water every 24 hours. Do not exceed one tablet in 24 hours. Do not divide, crush, chew, or dissolve the tablet.     Children  Do not use."

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hippocratic/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
