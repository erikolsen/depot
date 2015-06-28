require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :title => "SomeTitle",
        :description => "MyText",
        :image_url => "MyImage.jpg",
        :price => "9.99"
      ),
      Product.create!(
        :title => "SomeOtherTitle",
        :description => "MyText",
        :image_url => "MyImage.jpg",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "SomeTitle".to_s, :count => 1
    assert_select "tr>td", :text => "SomeOtherTitle".to_s, :count => 1
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyImage.jpg".to_s, :count => 2
  end
end
