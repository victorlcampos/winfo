require 'factory_girl'
Dir[Rails.root.join('spec/factories/*.rb')].each { |f| require f }

article = {
  title: '10 Agile Kids You Should Know About',
  body: 'The HTML and CSS for this layout show how you can make a modern,
        responsive landing page for your next product. Browse through the
        source to see how we use menus and responsive grids to create this
        layout. Shrink your browser width and watch the layout transform
        and play nice with small screens.'
}

FactoryGirl.create(:article, article)
FactoryGirl.create(:article, article)