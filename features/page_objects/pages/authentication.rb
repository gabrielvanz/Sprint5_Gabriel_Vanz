require_relative '../sections/registration'
require_relative '../sections/login'

module Pages
    class Authentication < SitePrism::Page
        set_url '/index.php?controller=authentication&back=my-account#account-creation'
        
        # Registration
        section :registration, Sections::Registration, '#authentication'
    
        def set_email_adress(email)
            registration.input_email.set email
            registration.btn_create_account.click
        end
    
        def set_field_entries(name,lastname,password,address,city,post_code,telephone)
           registration.name.set name
           registration.lastname.set lastname
           registration.password.set password
           registration.address.set address
           registration.city.set city
           registration.state[2].click
           registration.postal_code.set post_code
           registration.telephone.set telephone
        end
        
        # Login
        section :login, Sections::Login, 'body'
           
        def set_user_configs(email,password)
            login.input_email.set email
            login.input_password.set password
            login.btn_login.click
        end

        def forgot_pass(email)
            login.input_email_retrieve_password.set email
            login.btn_retrieve_password.click
        end
    end
end