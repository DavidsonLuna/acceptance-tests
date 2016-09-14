require 'spec_helper'

describe 'Login' do
    before do
        visit 'http://vip-producteditor-front.qa.vmcommerce.intra/signin'
    end

    # Username
    scenario 'login with wrong credentials', js: true do
        find(:css, 'input[name=username]').set('username')
        # Password
        find(:css, 'input[name=password]').set('password')
        # Log In bottom
        # find(:css, 'input[type=submit]').trigger('click')
        # find_button('Log In').trigger('click')
        find(:css, 'input[type=submit]').set('click')
        # Expect Message
        def with_wait_time_of
            wait_time_of 1 do
                expect(page).to have_content("The username and password you entered don't match.")
            end
        end
    end

    scenario 'empty login fields', js: true do
        # Username
        find(:css, 'input[name=username]').set('')
        # Password
        find(:css, 'input[name=password]').set('')
        # Log In bottom
        find(:css, 'input[type=submit]').set('click')
        # Expect Message
        def with_wait_time_of
            wait_time_of 1 do
                expect(page).to have_content('Username and password required')
            end
        end
    end
end
