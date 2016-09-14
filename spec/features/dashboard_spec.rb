require 'spec_helper'

feature 'dashboard' do
    scenario 'select tab dashboard' do
        signin
        select_tab_dashboard
    end

    def select_tab_dashboard
        click_link 'Dashboard'
        page.find(:css, 'select').select('Produto')
    end
end
