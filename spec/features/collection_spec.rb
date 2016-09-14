require 'spec_helper'

feature 'collection' do
    scenario 'select tab collection' do
        signin
        select_tab_collection
    end

    def select_tab_collection
        click_link 'Collection'
    end
end
