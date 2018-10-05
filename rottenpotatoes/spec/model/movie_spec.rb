require 'rails_helper'
require 'spec_helper'
describe Movie do
  describe 'find movies with same director' do
    it 'it should find movies by the same director' do
      fake_movie = Movie.create(:title => 'a' ,:director => 'Aladdin')
      fake_movie_2 =Movie.create(:title => 'b' ,:director => 'Aladdin')
      fm,fake_result,error =Movie.find_with_same_director(fake_movie.id)
      expect(error).to be false
      expect(fake_result).to include(fake_movie_2)
    end
    it 'it should not find movies by different directors' do
      fake_movie = Movie.create(:title => 'a' ,:director => 'Aladdin')
      fake_movie_2 =Movie.create(:title => 'b' ,:director => 'NotAladdin')
      fm,fake_result,error =Movie.find_with_same_director(fake_movie.id)
      expect(error).to be false
      expect(fake_result).not_to include(fake_movie_2)
    end
  end
  describe 'get movie ratings' do
    it 'it should get all possible ratings' do
      ratings_got = Movie.all_ratings
      expect(ratings_got).to eq ['G', 'PG', 'PG-13', 'NC-17', 'R']
    end  
  end
end