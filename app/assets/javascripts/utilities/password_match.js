document.addEventListener('turbolinks:load', function() {
    let page = document.querySelector('.check-pass');
    let password = document.getElementById('user_password');
    let password_confirmation = document.getElementById('user_password_confirmation');
    const registrationPage = new PasswordMatch(page);
    registrationPage.passwordsDefinition(password, password_confirmation);
})
