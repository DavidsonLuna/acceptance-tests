require 'spec_helper'

feature 'backlog' do
    scenario 'select tab backlog' do
        signin
        select_tab_backlog
    end

    def select_tab_backlog
        click_link 'Backlog'
        find(:xpath, "(//input[@type='checkbox'])[2]").click
    end
end
