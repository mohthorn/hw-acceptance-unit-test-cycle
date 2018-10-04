require 'rails_helper'
require 'spec_helper'
describe Movie do
  describe 'find movies with same director' do
    it 'it should find movies by the same director' do
      fake_movie = Movie.create(:title => 'a' ,:director => 'Aladdin',:id =>1)
      fake_movie_2 =Movie.create(:title => 'b' ,:director => 'Aladdin', :id=> 2)
      fm,fake_result,error =Movie.find_with_same_director(1)
      expect(error).to be false
      expect(fake_result).to include(fake_movie_2)
    end
    it 'it should not find movies by different directors' do
      fake_movie = Movie.create(:title => 'a' ,:director => 'Aladdin',:id =>1)
      fake_movie_2 =Movie.create(:title => 'b' ,:director => 'NotAladdin', :id=> 2)
      fm,fake_result,error =Movie.find_with_same_director(1)
      expect(error).to be false
      expect(fake_result).not_to include(fake_movie_2)
    end
  end
end