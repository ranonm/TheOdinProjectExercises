require './lib/enumerable_methods.rb'

describe "#my_select" do
  it "returns only elements meeting specified criteria" do
    arr = [2, 4, 8, 5, 6, 7, 9]
    expect(arr.my_select{ |e| e % 2 == 0 }).to eql([2,4,8,6])
  end
end

describe "#my_all?" do
  it "returns true if all the elements are true for the condition" do
    arr = [2, 4, 6]
    expect(arr.my_all?{ |e| e % 2 == 0 }).to be_truthy
  end

  it "returns false if all the elements are not true for the condition" do
    arr = [2, 4, 6, 7]
    expect(arr.my_all?{ |e| e % 2 == 0 }).to be_falsey
  end
end

describe "#my_any?" do
  it "returns true if any of the elements are true for the condition" do
    arr = [2, 4, 6, 7]
    expect(arr.my_any? { |e| e % 2 == 0 }).to be_truthy
  end

  it "returns false if none of the elements are true for the condition" do
    arr = [3, 5, 7]
    expect(arr.my_any? { |e| e % 2 == 0 }).to be_falsey
  end
end

describe "#my_none" do
  it "returns true if none of the elements are true for the condition" do
    arr = [3, 5, 7]
    expect(arr.my_none? { |e| e % 2 == 0 }).to be_truthy
  end

  it "returns false if atleast one of the elements is true for the condition" do
    arr = [3, 5, 7, 10]
    expect(arr.my_none? { |e| e > 5 }).to be_falsey
  end
end

describe "#my_count" do
  it "returns 0 if enumerable is empty" do
    arr = []
    expect(arr.my_count).to eql(0)
  end

  it "returns a count of the number of elements in enumerable" do
    arr = [2, 3, 4]
    expect(arr.my_count).to eql(3)
  end
end

describe "#my_map" do
  it "returns an enumerable with the result of each element mapped to it's index" do
    arr = [2, 3, 4]
    expect(arr.my_map { |e| e * 2 } ).to eql([4, 6, 8])
  end
end