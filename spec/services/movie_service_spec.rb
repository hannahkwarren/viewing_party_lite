require 'rails_helper'

RSpec.describe MovieService do 

  context 'class methods' do 

    describe '.details' do 
      it 'returns movies data based on query term "top rated"' do 
        movies_data = MovieService.details('top rated')

        expect(movies_data).to be_an Array
        expect(movies_data.first[:results]).to be_an Array 

        first_movie = movies_data.first[:results].first 

        expect(first_movie).to have_key :original_title 
        expect(first_movie).to have_key :vote_average
        expect(first_movie).to have_key :genre_ids
        expect(first_movie).to have_key :poster_path
        expect(first_movie).to have_key :overview
      end

      it 'returns movies data based on query term "star"' do 
        movies_data = MovieService.details('star')

        expect(movies_data).to be_an Array
        expect(movies_data.first[:results]).to be_an Array 

        first_movie = movies_data.first[:results].first

        expect(first_movie).to have_key :original_title 
        expect(first_movie).to have_key :vote_average
        expect(first_movie).to have_key :genre_ids
        expect(first_movie).to have_key :poster_path
        expect(first_movie).to have_key :overview
      end
    end

    describe '.movie_data' do 
      it "returns one movie's data" do 
        movie_data = MovieService.movie_data(497698)

        expect(movie_data).to be_a Hash

        expect(movie_data).to have_key :original_title 
        expect(movie_data).to have_key :vote_average
        expect(movie_data).to have_key :genres
        expect(movie_data).to have_key :runtime
        expect(movie_data).to have_key :poster_path
        expect(movie_data).to have_key :overview
      end
    end

    describe '.credits' do 
      it 'returns credits for a movie' do 
        credits_data = MovieService.credits(497698)
        
        expect(credits_data).to be_an Array
        expect(credits_data.first).to be_a Hash

        first_cast_member = credits_data.first
        
        expect(first_cast_member).to have_key :name
        expect(first_cast_member).to have_key :character
      end
    end

    describe '.reviews' do 
      it 'returns reviews for a movie' do 
        reviews_data = MovieService.reviews(497698)

        expect(reviews_data).to be_a Hash
        expect(reviews_data[:results]).to be_an Array 

        first_review = reviews_data[:results].first
        
        expect(first_review).to have_key :author_details
        expect(first_review).to have_key :content
      end
    end
  end


end
