
module Authentication
    def signin
        visit 'http://vip-producteditor-front.qa.vmcommerce.intra/signin'
        find(:css, 'input[name=username]').set('adaptertester')
        find(:css, 'input[name=password]').set('Senhaparceiro123')
        find(:css, 'input.submit-pill-button').click
        end
end
