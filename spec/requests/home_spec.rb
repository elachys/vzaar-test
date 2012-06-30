require 'spec_helper'

describe 'home page' do
    it 'shows initial page with options for the user' do
        visit '/'
        page.should have_content('Anagram Finder')
    end

    it 'has an upload file feature which uploads a dictionary to the server' do
        visit '/'
        attach_file('Upload a new dictionary', 'spec/fixtures/dictionary.txt')
        click_button "Upload"
        page.should have_content("Dictionary loaded in")
    end

    it 'searches for anagrams of words in the uploaded dictionary',:js => true do
        visit '/'

        attach_file('Upload a new dictionary', File.join(::Rails.root, "spec/fixtures/dictionary.txt") )
        click_button "Upload"

        fill_in('Enter a word to search for anagrams', :with => 'pots')
        click_button('Search')

       page.should have_content("3 anagrams found for 'pots' in")
       page.should have_content("> post, spot, stop")
    end
end