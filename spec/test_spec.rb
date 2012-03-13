describe "some sample test" do

  it "can assert something" do
    a = 3
    b = 5
    sum = a + b
    sum.should == 8
    # sum.should equal 8
    # sum.should_not equal 8
  end

  it "a number should have a to_s function" do
    5.should respond_to(:to_s)
  end

  it "knows what type of class the object is" do
    "some string".should be_a_kind_of String
  end

  it "will find ? methods on objects" do
    "some object".should_not be_nil
  end

  it "can check if an array includes a value" do
    [1,2,3,4,5].should include(3)
  end

  it "handles exceptions" do
    lambda {
      data = [1,2,3,4,5]
      data.hello
    }.should raise_error
  end

  # ==
  # be_valid

end


