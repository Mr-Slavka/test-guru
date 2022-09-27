
class PasswordMatch {

    constructor (page) {
        this.page = page;
    }

    passwordsDefinition (password, password_confirmation) {
        let match = this.page.querySelector('.octicon-check');
        let noMatch = this.page.querySelector('.octicon-circle-slash');
        this.page.addEventListener('input', function () {
            if (password.value !== password_confirmation.value && password.value) {
                match.classList.add('hide');
                noMatch.classList.remove('hide');
            } else if (password.value === password_confirmation.value && password.value) {
                match.classList.remove('hide');
                noMatch.classList.add('hide');
            }
        });
    }
}