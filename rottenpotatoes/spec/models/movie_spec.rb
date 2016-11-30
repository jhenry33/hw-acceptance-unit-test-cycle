require 'rails_helper'

RSpec.describe Movie, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
require 'spec_helper'

describe Movie do
  describe 'find movies with the same director' do

    it 'should search for similar movies' do
      fake_movie = double('Movie', :director => 'George Lucas')
      Movie.should_receive(:find).with('1').and_return(fake_movie)
      fake_results = [double('Movie'), double('Movie')]
      Movie.should_receive(:find_all_by_director).with('George Lucas').and_return(fake_results)
      Movie.find_same_director('1')
    end

    it 'should raise an error if there is no director' do
      fake_movie = double('Movie', :director => '')
      Movie.should_receive(:find).with('1').and_return(fake_movie)
      lambda { Movie.find_same_director('1') }.should raise_error(Movie::NoDirectorInfo)
    end
  end
end
end